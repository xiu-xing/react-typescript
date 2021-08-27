import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:getuiflut/getuiflut.dart';
import 'package:crypto/crypto.dart';
import 'package:rime_app/utils/http.dart';
import 'package:rime_app/utils/storage.dart';

class GetuiPushUtil {
  final String getuiURL = 'https://restapi.getui.com/v2/EIiQJEsW6s6H1ntBL0LtF2';
  Future<String> initPlatformState() async {
    String platformVersion;
    if (Platform.isIOS) {
      Getuiflut().startSdk(
          appId: "EIiQJEsW6s6H1ntBL0LtF2",
          appKey: "z3xXgcnLDv66X0AucKMo03",
          appSecret: "6Rb2FhnQOHAt0FCvFFUme9");
    }
    try {
      platformVersion = await Getuiflut.platformVersion;

      debugPrint('platformVersion' + platformVersion);
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    return platformVersion;
  }

  Future<String> clientId() async {
    return Getuiflut.getClientId;
  }

  Future<void> initGetuiSdk() async {
    try {
      Getuiflut.initGetuiSdk;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void addEventHandler() {
    Getuiflut().addEventHandler(
      // 注册收到 cid 的回调
      onReceiveClientId: (String message) async {
        debugPrint("onReceiveClientId =====> CliendId: $message");
      },
      // 注册 DeviceToken 回调
      onRegisterDeviceToken: (String message) async {
        debugPrint("onRegisterDeviceToken =====> DeviceToken: $message");
      },
      // SDK收到透传消息回调
      onReceivePayload: (Map<String, dynamic> message) async {
        debugPrint("onReceivePayload =====> $message");
      },
      // 点击通知回调
      onReceiveNotificationResponse: (Map<String, dynamic> message) async {
        debugPrint("onReceiveNotificationResponse =====> $message");
      },
      // APPLink中携带的透传payload信息
      onAppLinkPayload: (String message) async {
        debugPrint("onAppLinkPayload =====> $message");
      },
      // VOIPTokenh回调
      onRegisterVoipToken: (String message) async {
        debugPrint("onRegisterVoipToken =====> $message");
      },
      // VOIP推送回调
      onReceiveVoipPayLoad: (Map<String, dynamic> message) async {
        debugPrint("onReceiveVoipPayLoad =====> $message");
      },
    );
  }

  /// 绑定别名
  /// @param alias 别名字符串
  /// @param aSn   绑定序列码, Android中无效, 仅在iOS有效, 默认空串
  void setAlias(String userID, {String aSn = ''}) {
    String alias = userID.replaceAll('-', '_');
    LocalStorage.sharedPreferences.setString('getuiAlias', alias);
    if (Platform.isIOS)
      iOSSetAlias(alias);
    else
      Getuiflut().bindAlias(alias, aSn);
  }

  /// 解绑别名
  /// @param alias 别名字符串
  /// @param aSn   绑定序列码, Android中无效, 仅在iOS有效, 默认空串
  void deleteAilas(String alias, {String aSn = ''}) {
    if (Platform.isIOS) {
      iOSUnbindAlias(alias);
    } else {
      Getuiflut().unbindAlias(alias, aSn, true);
    }
  }

  void resetBadge() {
    Getuiflut().resetBadge();
    Getuiflut().setLocalBadge(0);
  }

  /// 给用户打标签
  ///  @param tags 别名数组
  void setTag(List<String> tags) {
    Getuiflut().setTag(tags);
  }

  /// iOS 绑定别名
  Future<void> iOSSetAlias(String alias) async {
    String token = await getGETUIAuthToken();
    clientId().then((cId) {
      HttpUtils.request('$getuiURL/user/alias', method: HttpUtils.POST, data: {
        "data_list": [
          {"cid": cId, "alias": alias}
        ]
      }, headers: {
        "token": token
      }).then((value) => null);
    });
  }

  /// iOS 解绑别名
  Future<void> iOSUnbindAlias(String alias) async {
    String token = await getGETUIAuthToken();
    HttpUtils.request('$getuiURL/user/alias/$alias',
        method: HttpUtils.DELETE,
        headers: {"token": token}).then((value) => null);
  }

  Future<String> getGETUIAuthToken() async {
    var now = DateTime.now();
    String lsToken =
        LocalStorage.sharedPreferences.getString('getuiToken') ?? "";
    String token;
    if (lsToken != "") {
      int expireTime = int.parse(lsToken.substring(0, 13));
      token = lsToken.substring(13, lsToken.length);
      // token过期
      if (now.millisecondsSinceEpoch - expireTime < 82800000) {
        return token;
      }
    }

    String timestamp = now.millisecondsSinceEpoch.toString();
    String sign =
        "z3xXgcnLDv66X0AucKMo03" + timestamp + "s9z2syHXA5A5pMKIwigb85";
    var bytes = utf8.encode(sign);
    var sha = sha256.convert(bytes);

    var result = await HttpUtils.request(
      '$getuiURL/auth',
      method: HttpUtils.POST,
      data: {
        "sign": sha.toString(),
        "timestamp": timestamp,
        "appkey": "z3xXgcnLDv66X0AucKMo03"
      },
    );
    if (result.length > 0) {
      try {
        String token = result['data']['token'];
        String expireTime = result['data']['expire_time'];
        LocalStorage.sharedPreferences
            .setString('getuiToken', (expireTime + token));
        return token;
      } catch (err) {
        debugPrint('getui token err:' + err.toString());
      }
    }
    return '';
  }
}
