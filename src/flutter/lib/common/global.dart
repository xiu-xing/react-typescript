import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/utils/getui_push_util.dart';
import 'package:rime_app/utils/storage.dart';
import 'package:rime_app/widgets/verification/widgets/count_down/count_donw_notifier.dart';

import 'env.dart';

// import 'package:muse_dart/muse.dart' as muse;

class Global {
  static UserProvider userProvider = new UserProvider();
  static final CountDownNotifier countDownNotifier = CountDownNotifier(60);
  static int restartTime = 0;

  static GetuiPushUtil getuiPushUtil = new GetuiPushUtil();

  // 初始化全局信息，会在APP启动时执行
  static Future init() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await LocalStorage.getSPInstance();
    await GQL.initClient();

    MuseEventUtil.init(appId: MUSE_APP_ID);
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    await _initFluwx();
  }

  static Future<void> _initFluwx() async {
    bool result = await registerWxApi(
        appId: "wxc04959a9626f5d42",
        doOnAndroid: true,
        doOnIOS: true,
        universalLink: "https://rimedata.com/mobile/");

    if (result == false) {
      print("init wechat sdk failed");
    }
  }

  static Future<bool> checkUserInfo() async {
    Completer<bool> _completer = new Completer<bool>();
    final getUser = GUserInfoReq((b) => b);
    bool hasPhone = true;

    GQL.executeQuery<GUserInfoData, GUserInfoVars>(
      getUser,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.user != null) {
          userProvider.setUser(user: res.data?.user);
          if (res.data!.user!.phone == null || res.data!.user!.phone == "")
            hasPhone = false;
        }
        if (!_completer.isCompleted) _completer.complete(hasPhone);
      },
      onError: (stream, err) {
        _completer.complete(true);
        stream.cancel();
      },
    );

    return _completer.future;
  }

  static Future<bool> checkUserProfile() async {
    Completer<bool> _completer = new Completer<bool>();
    final getUserProfile = GUserProfileReq((b) => b);
    bool needUpdate = true;

    GQL.executeQuery<GUserProfileData, GUserProfileVars>(
      getUserProfile,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.userProfile?.fields != null) {
          res.data!.userProfile!.fields!.forEach((value) {
            needUpdate = value.isRequired == true &&
                (value.selectedOptions == null ||
                    value.selectedOptions!.isEmpty);
          });
        }
        if (!_completer.isCompleted) _completer.complete(!needUpdate);
      },
      onError: (stream, err) {
        if (!_completer.isCompleted) _completer.complete(true);
        stream.cancel();
      },
    );

    return _completer.future;
  }

  static Future<String> updateAccessToken() async {
    Completer<String> _completer = new Completer<String>();
    StreamSubscription? subscription;
    print("update token");

    String token = await SecureStorage.readValue(key: 'token') ?? "";
    if (token == "") {
      print("token is empty ");
      _completer.complete(Routes.signIn);
      return _completer.future;
    }

    Timer timer;

    timer = Timer(Duration(seconds: 10), () {
      subscription?.cancel();
      if (!_completer.isCompleted) _completer.complete(Routes.signIn);
    });

    subscription =
        GQL.ferryClient.request(GUpdateAccessTokenReq()).listen((res) async {
      timer.cancel();
      if (res.hasErrors || res.data?.updateAccessToken == null) {
        print("update token fail");
        _completer.complete(Routes.signIn);
        return;
      }
      token = res.data?.updateAccessToken ?? "";
      await SecureStorage.writeValue(key: 'token', value: token);
      String initRes = await GQL.initClient();
      if (initRes == "success") _completer.complete(Routes.home);
      print("update token success");
    });

    return _completer.future;
  }
}
