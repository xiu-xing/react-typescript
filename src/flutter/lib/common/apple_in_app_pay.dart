import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/market/market.data.gql.dart';
import 'package:rime_app/graphql/mutations/market/market.req.gql.dart';
import 'package:rime_app/graphql/mutations/market/market.var.gql.dart';

class AppleInAppPay {
  BuildContext? context;
  FlutterInappPurchase flutterInappPay = FlutterInappPurchase.instance;
  StreamSubscription? _purchaseUpdatedSubscription;
  StreamSubscription? _purchaseErrorSubscription;
  StreamSubscription? _conectionSubscription;

  void init(BuildContext context) async {
    this.context = context;
    await flutterInappPay.initConnection;

    _purchaseUpdatedSubscription =
        FlutterInappPurchase.purchaseUpdated.listen(handleApplePurchaseUpdate);

    _purchaseErrorSubscription =
        FlutterInappPurchase.purchaseError.listen(handleApplePurchaseError);

    List<PurchasedItem>? items = await flutterInappPay.getAvailablePurchases();

    for (var item in items ?? []) {
      bool res = await checkPurchasedItem(item);
      if (res) {
        EventBusUtil.fire(UserFinishPaymentEvent(""));
        showToast("支付成功");
      }
    }
  }

  void handleApplePurchaseUpdate(PurchasedItem? item) async {
    if (item != null) {
      bool res = await checkPurchasedItem(item);

      if (res) {
        EventBusUtil.fire(UserFinishPaymentEvent(""));
        showToast("支付成功");
      }
    }
  }

  void handleApplePurchaseError(PurchaseResult? purchaseError) {
    if (purchaseError!.code == "E_USER_CANCELLED") {
      showToast('取消支付');
    } else {
      showToast('支付失败');
    }
  }

  Future<bool> checkPurchasedItem(PurchasedItem item) async {
    String payload = jsonEncode({
      "productId": item.productId,
      "transactionId": item.transactionId,
      "transactionDate":
          (item.transactionDate!.millisecondsSinceEpoch / 1000).round(),
      "transactionReceipt": item.transactionReceipt,
      "transactionStateIOS": item.transactionStateIOS.toString(),
    });

    await flutterInappPay.finishTransactionIOS(item.transactionId!);

    return checkApplePayReceipt(item.transactionId!, payload);
  }

  Future<bool> checkApplePayReceipt(String orderId, String payload) async {
    Completer<bool> _c = Completer();

    GQL.executeQuery<GApplePayData, GApplePayVars>(
      GApplePayReq(
        (b) => b
          ..vars.input.orderID = orderId
          ..vars.input.payload = payload,
      ),
      onData: (s, d) {
        s.cancel();
        _c.complete(d.data?.applePay ?? false);
      },
      onError: (s, e) {
        s.cancel();
        _c.completeError("收据验证失败");
      },
    );

    return _c.future;
  }

  void dispose() {
    _conectionSubscription?.cancel();
    _purchaseErrorSubscription?.cancel();
    _purchaseUpdatedSubscription?.cancel();
    flutterInappPay.endConnection;
  }
}
