import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/storage.dart';

class NotifyDialog extends StatelessWidget {
  const NotifyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0.w))),
      child: Container(
        height: 0.35.sh,
        width: 270.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text("用户使用协议和隐私政策",
                          textAlign: TextAlign.center, style: headline2),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: normalColor,
                              fontFamily: notoSansSC,
                            ),
                            children: [
                              TextSpan(
                                text: '请您务必审慎阅读、充分理解“用户使用协议”和“隐私政策”各条款。您可阅读',
                              ),
                              TextSpan(
                                text: '《用户使用协议》',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: highlightColor,
                                  fontFamily: notoSansSC,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    String website =
                                        '$WEB_ENDPOINT/service-agreement';
                                    String title = '用户服务协议';
                                    router.navigateTo(context,
                                        '${Routes.webview}?url=${Uri.encodeComponent(website)}&title=${Uri.encodeComponent(title)}');
                                  },
                              ),
                              TextSpan(
                                text: '和',
                              ),
                              TextSpan(
                                text: '《隐私政策》',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: highlightColor,
                                  fontFamily: notoSansSC,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    String website = '$WEB_ENDPOINT/privacy';
                                    String title = '隐私政策';
                                    router.navigateTo(context,
                                        '${Routes.webview}?url=${Uri.encodeComponent(website)}&title=${Uri.encodeComponent(title)}');
                                  },
                              ),
                              TextSpan(text: '了解详细信息。如您同意，请点击“同意”开始接受我们的服务。')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: greyEE,
                ),
                Material(
                  color: Colors.transparent,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(width: 0.5, color: greyEE)),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                            child: SizedBox(
                              height: 48.h,
                              child: Center(
                                  child: Text(
                                "暂不使用",
                                style: headline2,
                              )),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(width: 0.5, color: greyEE)),
                          ),
                          child: InkWell(
                            onTap: () {
                              LocalStorage.sharedPreferences
                                  .setString("app", "RimeData");
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: 48.h,
                              child: Center(
                                  child: Text(
                                "同意",
                                style:
                                    headline2.copyWith(color: highlightColor),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
