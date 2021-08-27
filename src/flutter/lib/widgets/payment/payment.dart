import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/market/market.data.gql.dart';
import 'package:rime_app/graphql/mutations/market/market.req.gql.dart';
import 'package:rime_app/graphql/mutations/market/market.var.gql.dart';
import 'package:rime_app/graphql/queries/market/market.data.gql.dart';
import 'package:rime_app/graphql/queries/market/market.req.gql.dart';
import 'package:rime_app/graphql/queries/market/market.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/payment/wechat_payload.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:rime_app/widgets/payment/header.dart';
import 'package:fluwx/fluwx.dart';
import 'package:rime_app/widgets/payment/horizantal_items.dart';
import 'package:rime_app/widgets/payment/payment_items.dart';
import 'package:tobias/tobias.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key, this.serviceEndTime}) : super(key: key);
  final String? serviceEndTime;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with WidgetsBindingObserver {
  String? commodityID;
  String? orderId;

  GTypeOrder payment = GTypeOrder.WechatPayMobile;
  StreamSubscription? wechatPayLinsener;
  bool canPay = false;

  Future<void> otherPay() async {
    String? orderId;
    try {
      orderId = await _createOrder(commodityID);
    } catch (e) {
      showToast(e.toString());
    }

    if (orderId != null) {
      createPayOrder(orderId);
    }
  }

  Future<String>? _createOrder(String? commodityID) {
    Completer<String> _c = Completer();

    if (commodityID == null) _c.completeError("订单创建失败");

    GQL.executeQuery<GCreateOrderData, GCreateOrderVars>(
      GCreateOrderReq((b) => b
        ..requestId = "createOrder"
        ..vars.input.commodityID = commodityID),
      onData: (stream, response) async {
        stream.cancel();
        if (response.data?.createOrder?.orderID != null) {
          _c.complete(response.data?.createOrder?.orderID);
        } else {
          _c.completeError("订单创建失败");
        }
      },
      onError: (stream, error) {
        stream.cancel();
        _c.completeError("订单创建失败");
      },
    );

    return _c.future;
  }

  void createPayOrder(String orderID) {
    GQL.executeQuery<GPayOrderData, GPayOrderVars>(
      GPayOrderReq((b) => b
        ..requestId = "payOrder"
        ..vars.input.orderID = orderID
        ..vars.input.typeOrder = payment),
      onData: (stream, response) {
        stream.cancel();

        if (response.data?.payOrder?.payload == null) return;
        EasyLoading.show(
          status: '加载中...',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );
        if (payment == GTypeOrder.WechatPayMobile)
          wechatPay(response.data!.payOrder!.payload);

        if (payment == GTypeOrder.AliPayMobile)
          alipay(response.data!.payOrder!.payload);
      },
      onError: (stream, errors) {
        stream.cancel();
        errors.forEach((error) {
          if (error.message
              .contains("Order has been closed or Order has been paid")) {
            showToast("订单已完成");
            EventBusUtil.fire<UserFinishPaymentEvent>(
                UserFinishPaymentEvent(commodityID ?? ""));
            router.pop(context);
          }
        });
      },
    );
  }

  void wechatPay(String payload) {
    var jsonString = jsonDecode(payload);
    WeChatPayloadModel model = WeChatPayloadModel.fromJson(jsonString);
    payWithWeChat(
      appId: model.appId,
      partnerId: model.partnerId,
      prepayId: model.prepayId,
      packageValue: model.package,
      nonceStr: model.noncestr,
      timeStamp: int.parse(model.timestamp),
      sign: model.sign,
    ).then((data) {
      // print("$data");
    });
  }

  void alipay(String payload) {
    aliPay(payload).then((value) {
      if (EasyLoading.isShow) EasyLoading.dismiss();
      if (value["resultStatus"] == "9000") {
        onSuccess();
      } else {
        showToast("已取消付款");
      }
    });
  }

  Future<void> applePay() async {
    if (commodityID != null) {
      await FlutterInappPurchase.instance.getProducts([commodityID!]);

      await FlutterInappPurchase.instance.requestPurchase(commodityID!);
    }
  }

  void onSuccess() {
    MuseEventUtil.sendEvent(
      eventId: MuseEventUtil.PaymentVIPId,
      value: {
        "order_id": {"value": orderId}
      },
    );
    EventBusUtil.fire(UserFinishPaymentEvent(commodityID ?? ""));
    showToast("支付成功");
    router.pop(context);
  }

  void checkOrder() {
    EasyLoading.dismiss();
    GQL.executeQuery<GCheckPaymentData, GCheckPaymentVars>(
        GCheckPaymentReq((b) => b
          ..requestId = "CheckPayment"
          ..vars.orderID = orderId), onData: (s, r) {
      if (r.data?.checkPayment == true) onSuccess();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        if (EasyLoading.isShow) checkOrder();
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);

    wechatPayLinsener = weChatResponseEventHandler.listen((res) {
      if (res is WeChatPaymentResponse) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
        if (res.isSuccessful) {
          onSuccess();
        } else
          showToast("已取消付款");
      }
    });
    super.initState();
  }

  void pay() {
    if (payment == GTypeOrder.ApplePay) {
      applePay();
      return;
    }
    otherPay();
    return;
  }

  @override
  void dispose() async {
    super.dispose();
    wechatPayLinsener?.cancel();

    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleCenter: true,
        title: Text(
          "订单确认",
          style: TextStyle(
            fontFamily: notoSansSC,
            fontSize: 18.sp,
            color: Pigment.fromString("#333"),
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [SizedBox(width: 40.w)],
        elevation: 0,
      ),
      body: Column(
        children: [
          MarketManagementHeader(serviceEndTime: widget.serviceEndTime),
          MarketHorizantalItems(
            onChange: (value) => setState(() => commodityID = value),
          ),
          MarketPaymentItems(
            onChange: (value) => setState(() {
              payment = value.item1;
              canPay = value.item2;
            }),
          ),
          Spacer(),
          FlatTextButton(
            text: widget.serviceEndTime == null ? "开通 VIP" : "续费 VIP",
            onTap: canPay ? pay : null,
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            textStyle: headline2.copyWith(color: Pigment.fromString("#FFF")),
          ),
          SizedBox(height: 25.h)
        ],
      ),
    );
  }
}
