import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckUpdateDialog extends StatelessWidget {
  final String downloadUrl;
  const CheckUpdateDialog(this.downloadUrl, {Key? key}) : super(key: key);

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
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Material(
                  borderRadius: BorderRadius.circular(16.h),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16.h),
                    onTap: () {
                      router.pop(context);
                    },
                    child: SizedBox(
                      height: 32.w,
                      width: 32.w,
                      child: Icon(MdiIcons.close, color: grey99),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 56.w,
                        height: 56.w,
                        child: Image.asset("assets/images/rime-logo.jpg"),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "全新版本上线",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Pigment.fromString("#333"),
                          fontFamily: notoSansSC,
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
                  child: InkWell(
                    onTap: () async {
                      try {
                        await canLaunch(this.downloadUrl);
                        await launch(this.downloadUrl);
                      } catch (e) {
                        showToast("打开链接失败");
                      }
                    },
                    child: SizedBox(
                      height: 48.h,
                      child: Center(
                          child: Text(
                        "立即更新",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: primaryColor,
                            fontFamily: notoSansSC),
                      )),
                    ),
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
