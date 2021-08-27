import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluwx/fluwx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeChatSignInWidget extends StatefulWidget {
  const WeChatSignInWidget({Key? key, this.disable = false}) : super(key: key);

  final bool disable;
  @override
  _WeChatSignInWidgetState createState() => _WeChatSignInWidgetState();
}

class _WeChatSignInWidgetState extends State<WeChatSignInWidget> {
  void weChatsignIn() async {
    bool isInstalled = await isWeChatInstalled;
    if (isInstalled) {
      sendWeChatAuth(scope: "snsapi_userinfo", state: "rime").catchError((e) {
        showToast(e);
      });
    } else {
      showToast("请先安装微信");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 510.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 94.h),
          SvgPicture.asset(
            'assets/images/sign_in/LOGO_primary.svg',
            height: 22.w,
            width: 186.w,
          ),
          SizedBox(height: 12.h),
          Text("全面的一级市场数据平台", style: headline1),
          SizedBox(height: 52.h),
          Container(
            width: 200.w,
            height: 200.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sign_in/bg.webp"),
              ),
            ),
          ),
          SizedBox(height: 56.h),
          Spacer(),
          FlatTextButton(
            text: "微信登录/注册",
            onTap: widget.disable ? null : weChatsignIn,
            width: 311.w,
            textStyle: headline2.copyWith(color: Pigment.fromString("#FFF")),
            prefix: Container(
              margin: EdgeInsets.only(right: 8.w),
              child: Icon(
                MdiIcons.wechat,
                size: 24.w,
                color: Pigment.fromString("#FFF"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
