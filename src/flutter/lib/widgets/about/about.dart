import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/application.dart';
import 'package:rime_app/widgets/account/widgets/menu-item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/custom_icons/custom_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rime_app/widgets/common/logo/logo.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../router.dart';
import 'package:launch_review/launch_review.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  Future<PackageInfo> _getPKGInfo() {
    return PackageInfo.fromPlatform();
  }

  Future<void> _checkUpdate() async {
    if (Platform.isIOS) {
      final url = "https://itunes.apple.com/cn/app/$APPLE_APP_ID";

      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false);
      } else {
        throw 'Could not launch $url';
      }
    }

    if (Platform.isAndroid) {
      Tuple2<bool, String?> res = await checkAppVersionUpToDate();
      if (res.item1) {
        if (await canLaunch(res.item2!)) {
          await launch(res.item2!);
        } else {
          throw 'Could not launch ${res.item2!}';
        }
      } else {
        showToast("暂无更新");
      }
    }
  }

  Future<void> _appReview() async {
    await LaunchReview.launch(writeReview: true, iOSAppId: APPLE_APP_ID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // customizable: true,
        leading: IconButton(
          splashRadius: 24.sp,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.chevron_left,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        // titleCenter: true,
        title: Text(
          "关于我们",
          style: headline4.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder<PackageInfo>(
        future: _getPKGInfo(),
        builder: (ctx, snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 214.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 48.h,
                    ),
                    SvgPicture.asset(
                      'assets/images/logo-icon.svg',
                      width: 72.w,
                      height: 72.w,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    RimeLogo(
                      color: grey33,
                      width: 100,
                      height: 16,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      "Version ${snapshot.data!.version}",
                      style: subtitle1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Platform.isIOS
                  ? MenuItem(
                      title: "去评分",
                      icon: CustomIcons.staroutline,
                      underline: false,
                      onPress: _appReview,
                    )
                  : SizedBox(),
              MenuItem(
                title: "版本更新",
                icon: CustomIcons.refresh,
                underline: false,
                onPress: _checkUpdate,
              ),
              Spacer(),
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '《用户协议》',
                      style: bodyText2.copyWith(
                        color: highlightColor,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          String website = '$WEB_ENDPOINT/service-agreement';
                          router.navigateTo(context,
                              '${Routes.webviewPage}?url=${Uri.encodeComponent(website)}');
                        },
                    ),
                    TextSpan(
                      text: '《隐私政策》',
                      style: bodyText2.copyWith(
                        color: highlightColor,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          String website = '$WEB_ENDPOINT/privacy';

                          router.navigateTo(context,
                              '${Routes.webviewPage}?url=${Uri.encodeComponent(website)}');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Copyright © 2021",
                style: bodyText1.copyWith(
                  color: grey99,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "深圳来觅数据信息技术有限公司",
                style: bodyText1.copyWith(
                  color: grey99,
                ),
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          );
        },
      ),
    );
  }
}
