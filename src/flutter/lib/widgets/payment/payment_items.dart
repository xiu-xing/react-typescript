import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/custom_checkbox/custom_checkbox.dart';
import 'package:tobias/tobias.dart';
import 'package:tuple/tuple.dart';

MarketThirdPartPayment wechat = MarketThirdPartPayment(
  "微信",
  "assets/images/third_part/wechat.svg",
  GTypeOrder.WechatPayMobile,
);
MarketThirdPartPayment apple = MarketThirdPartPayment(
  "Apple Pay",
  "assets/images/third_part/apple.svg",
  GTypeOrder.ApplePay,
);
MarketThirdPartPayment alipay = MarketThirdPartPayment(
  "支付宝",
  "assets/images/third_part/alipay.svg",
  GTypeOrder.AliPayMobile,
);

class MarketPaymentItems extends StatefulWidget {
  const MarketPaymentItems({Key? key, this.onChange}) : super(key: key);
  final ValueChanged<Tuple2<GTypeOrder, bool>>? onChange;

  @override
  _MarketPaymentItemsState createState() => _MarketPaymentItemsState();
}

class _MarketPaymentItemsState extends State<MarketPaymentItems> {
  int currentItem = 0;
  List<MarketThirdPartPayment> androidPaymentList = [wechat, alipay];
  List<MarketThirdPartPayment> iosPaymentList = [wechat, apple, alipay];

  void checkAliPay() async {}

  Future<bool> canPay(MarketThirdPartPayment payment) async {
    switch (payment.typeOrder) {
      case GTypeOrder.AliPayMobile:
        return await isAliPayInstalled();
      case GTypeOrder.WechatPayMobile:
        return await isWeChatInstalled;
      case GTypeOrder.ApplePay:
        return true;
      default:
        return false;
    }
  }

  Future<void> itemOnTap(int index, MarketThirdPartPayment payment) async {
    setState(() => currentItem = index);
    if (widget.onChange != null)
      widget.onChange!(Tuple2(payment.typeOrder, await canPay(payment)));
  }

  Widget paymentItem(int index, MarketThirdPartPayment payment) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => itemOnTap(index, payment),
      child: Container(
        height: 56.h,
        padding: EdgeInsets.only(left: 24.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(payment.icon, height: 20.w),
            SizedBox(width: 16.w),
            Text(payment.name, style: subtitle1),
            Spacer(),
            IgnorePointer(
              ignoring: true,
              child: CustomCheckbox(
                value: index == currentItem,
                width: 20.w,
                onChanged: (v) {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.w)),
                ),
                side: BorderSide(width: 1.5, color: Pigment.fromString("#666")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initChange() async {
    if (widget.onChange != null)
      widget
          .onChange!(Tuple2(GTypeOrder.WechatPayMobile, await canPay(wechat)));
  }

  @override
  void initState() {
    initChange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MarketThirdPartPayment> list = iosPaymentList;
    if (Platform.isAndroid) list = androidPaymentList;
    return Container(
      constraints: BoxConstraints(maxHeight: 300.h),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            list.length,
            (i) => paymentItem(i, list[i]),
          ),
        ),
      ),
    );
  }
}

class MarketThirdPartPayment {
  String icon;
  String name;
  GTypeOrder typeOrder;
  MarketThirdPartPayment(this.name, this.icon, this.typeOrder);
}
