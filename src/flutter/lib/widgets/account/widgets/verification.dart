import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/graphql/queries/business_card/business_card.data.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme.dart';

class Verification extends StatefulWidget {
  Verification(
    this.detail, {
    Key? key,
    this.padding,
    this.margin,
  }) : super(key: key);

  final GBusinessCardDetailData_bussinessCardDetail? detail;
  final double? padding;
  final double? margin;

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextStyle title = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: notoSansSC,
    color: Pigment.fromString("#333"),
  );

  TextStyle subTitle = TextStyle(
    fontSize: 14.sp,
    fontFamily: notoSansSC,
    fontWeight: FontWeight.w400,
    color: Pigment.fromString("#666"),
  );

  Map<TicketStatus, Tuple3<String, String, String>> contentMap = {
    TicketStatus.UnUpload: Tuple3("我的机构", "认证机构，解锁更多功能", "认证"),
    TicketStatus.Pending: Tuple3("信息审核中...", "认证机构，解锁更多功能", ""),
    TicketStatus.Success: Tuple3("机构审核成功", "认证机构，解锁更多功能", "验证"),
  };

  Widget _buildChild(BuildContext context, UserProvider provider) {
    TicketStatus index = provider.ticketStatus;

    if (index == TicketStatus.Failed) {
      String item2 = "审核失败，请重新上传";
      if (widget.detail?.msg != null) {
        item2 = "拒绝原因：" + (widget.detail?.msg ?? "");
      }
      contentMap.addAll({TicketStatus.Failed: Tuple3("信息审核失败", item2, "重新审核")});
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contentMap[index]!.item1,
                style: title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                contentMap[index]!.item2,
                style: subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        contentMap[index]!.item3 == ""
            ? Container()
            : FlatTextButton(
                text: contentMap[index]!.item3,
                width: 76.w,
                height: 32.h,
                onTap: () {
                  router
                      .navigateTo(context, "${Routes.verfication}")
                      .then((value) {
                    Global.userProvider.getUser();
                  });
                },
                textStyle: bodyText2.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) => Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: widget.margin ?? 12.h),
        padding: EdgeInsets.symmetric(
            vertical: widget.padding ?? 0, horizontal: 16.w),
        child: _buildChild(context, provider),
      ),
    );
  }
}
