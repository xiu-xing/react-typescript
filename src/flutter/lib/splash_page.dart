import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/load_config.dart';

import 'common/global.dart';

// 启动页
class SplashPage extends StatefulWidget {
  final bool showInvitationSnackBar;

  const SplashPage({
    Key? key,
    this.showInvitationSnackBar = false,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      MuseEventUtil.getInstance().options?.screenSize =
          MediaQuery.of(context).size;
    });
    loadConfig(REALM_CONDITION_CONFIG);
    startHome();
  }

  startHome() async {
    String path;
    Future.delayed(Duration(milliseconds: 1000)).then((_) async {
      path = await Global.updateAccessToken();
      router.navigateTo(context, path, replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    Global.userProvider.setContext(context);
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 114.h,
              ),
              Container(
                height: 351.h,
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 351.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/map.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/logo-icon.svg',
                        width: 72.w,
                        height: 72.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 98.h,
              ),
              SvgPicture.asset(
                'assets/images/slogan.svg',
                height: 20.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '全面的一级市场数据平台',
                style: bodyText1.copyWith(color: grey73),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false);
  }
}
