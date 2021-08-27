import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({Key? key, required this.onChange}) : super(key: key);
  final ValueChanged onChange;

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isSelected = !isSelected);
        widget.onChange(isSelected);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Icon(MdiIcons.checkboxBlankOutline, size: 14),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 200),
                  child: Icon(MdiIcons.checkboxMarked, size: 14),
                ),
              ),
            ],
          ),
          SizedBox(width: 2.w),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "登录即同意 "),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      String website = '$WEB_ENDPOINT/privacy';
                      String title = '隐私政策';
                      router.navigateTo(context,
                          '${Routes.webview}?url=${Uri.encodeComponent(website)}&title=${Uri.encodeComponent(title)}');
                    },
                  text: "《隐私政策》",
                  style: TextStyle(color: theme.primaryColor),
                ),
                TextSpan(text: " 和 "),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      String website = '$WEB_ENDPOINT/service-agreement';
                      String title = '用户使用协议';
                      router.navigateTo(context,
                          '${Routes.webview}?url=${Uri.encodeComponent(website)}&title=${Uri.encodeComponent(title)}');
                    },
                  text: "《用户使用协议》",
                  style: TextStyle(color: theme.primaryColor),
                ),
              ],
              style: bodyText2.copyWith(
                color: Pigment.fromString("#999"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
