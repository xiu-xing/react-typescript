import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:rime_app/widgets/common/icon_button.dart';
import 'package:rime_app/widgets/verification_next/advertisement.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();

  Verification({Key? key}) : super(key: key);
}

class _VerificationState extends State<Verification>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ValueNotifier<int> index = ValueNotifier<int>(0);

  void navigatorToVerify(String method) {
    router.navigateTo(
      context,
      "${Routes.verified}?verifyMethod=$method",
    );
  }

  Widget headerWidget() {
    return Ink(
      height: 158.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/discovery/header-background.png"),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    CommonIconButton(
                      icon: Icon(
                        MdiIcons.chevronLeft,
                        color: Colors.white,
                      ),
                      onTap: () => router.pop(context),
                    ),
                    Center(
                      child: Text(
                        "权益",
                        style: subtitle1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/discovery/LOGO.svg',
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "用数据赋能决策，让数据垂手可得",
                      style: TextStyle(
                        color: Pigment.fromString("#fff"),
                        fontSize: 14.sp,
                        fontFamily: notoSansSC,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 78.h,
            right: 0,
            child: Ink(
              width: 92.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(16.h)),
                color: Pigment.fromString("#5192B8"),
                boxShadow: [
                  BoxShadow(
                      color: Pigment.fromString("#000000").withOpacity(0.2),
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      spreadRadius: 0),
                  BoxShadow(
                      color: Pigment.fromString("#000000").withOpacity(0.12),
                      offset: Offset(0, 3),
                      blurRadius: 3,
                      spreadRadius: -2),
                  BoxShadow(
                      color: Pigment.fromString("#000000").withOpacity(0.14),
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      spreadRadius: 0),
                ],
              ),
              child: InkWell(
                onTap: () => navigatorToVerify("invitationCode"),
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(16.h)),
                child: Container(
                  padding: EdgeInsets.only(left: 12.w, top: 4.h, bottom: 4.h),
                  child: Center(
                    child: Text(
                      "我有邀请码",
                      style:
                          bodyText1.copyWith(color: Colors.white, height: 1.2),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2)
      ..addListener(() {
        index.value = _tabController?.index ?? 0;
      });
  }

  @override
  void didChangeDependencies() {
    Global.userProvider.getTeamInfo();
    Global.userProvider.getBusinessCardDetail();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            headerWidget(),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 138.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.w)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: CommonTabBar(
                      tabs: ["VIP 会员", "机构专业版"],
                      controller: _tabController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Advertisement(
                          url: "/mobile/advertisement/rights",
                        ),
                        Advertisement(
                          url: "/mobile/advertisement/product-introduction",
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: index,
                    builder: (ctx, i, _) {
                      return FlatTextButton(
                        text: i == 0 ? "开通会员" : "认证机构",
                        height: 48.h,
                        borderRadius: 0,
                        onTap: i == 0
                            ? () => router.navigateTo(context, Routes.payment)
                            : () => navigatorToVerify("uploadBussinesCard"),
                        textStyle: headline2.copyWith(color: Colors.white),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
