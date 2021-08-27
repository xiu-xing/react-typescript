import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/restart_widget.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/splash_page.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/application.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:screenshot_callback/screenshot_callback.dart';

import 'common/apple_in_app_pay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Global.init().then(
    (e) => runApp(RestartWidget(child: RimeApp())),
  );
}

class RimeApp extends StatefulWidget {
  RimeApp({Key? key}) : super(key: key);

  @override
  _RimeAppState createState() => _RimeAppState();
}

class _RimeAppState extends State<RimeApp> {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  ScreenshotCallback screenshotCallback = ScreenshotCallback();
  AppleInAppPay applePay = AppleInAppPay();

  @override
  void initState() {
    // Check screenshot
    screenshotCallback.addListener(() {
      print("screenshot");
    });
    if (Platform.isIOS) {
      applePay.init(context);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      applePay.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5)).then((value) {
      checkUpdate(_navigatorKey).then((value) => {});
    });

    defineRoutes(router);
    Global.userProvider = UserProvider(context: context);
    return OKToast(
      dismissOtherOnShow: true,
      duration: Duration(seconds: 2),
      position: ToastPosition(align: Alignment.bottomCenter, offset: 0),
      child: MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider.value(value: Global.userProvider),
        ],
        child: MaterialApp(
          title: 'RIME',
          onGenerateRoute: router.generator,
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: Builder(builder: (context) {
            ScreenUtil.init(
              BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              designSize: Size(375, 667),
            );
            return SplashPage();
          }),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('zh', 'CH'),
            const Locale('en', 'US'),
          ],
          builder: EasyLoading.init(
            builder: (context, child) {
              if (!IS_DEV) {
                ErrorWidget.builder = (errorDetail) {
                  MuseEventUtil.sendEvent(
                      eventId: MuseEventUtil.AppErrorEventId,
                      value: {"msg": errorDetail.exception.toString()});
                  return Empty404();
                };
              }
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
