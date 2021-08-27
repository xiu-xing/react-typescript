import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluwx/fluwx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/storage.dart';
import 'package:rime_app/widgets/authorization/cellphone_sign_in.dart';
import 'package:rime_app/widgets/authorization/password_sign_in.dart';
import 'package:rime_app/widgets/authorization/privacy_check.dart';
import 'package:rime_app/widgets/authorization/wechat_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/dialog/notify_dialog.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum SignInMethod {
  WECHAT,
  CELLPHONE,
  EMAILPASSWORD,
}

class SignInNext extends StatefulWidget {
  const SignInNext({Key? key}) : super(key: key);

  @override
  _SignInNextState createState() => _SignInNextState();
}

class _SignInNextState extends State<SignInNext> {
  StreamSubscription? _wechatCallbackStream;
  StreamSubscription? _wechatLoginStream;
  SignInMethod _signInMethod = SignInMethod.WECHAT;
  bool isSelected = false;

  void weChatSignInGraphQL(String code) {
    EasyLoading.show(status: '加载中...', maskType: EasyLoadingMaskType.black);

    final loginByWechat = GLoginByWeChatReq((b) => b
      ..requestId = "loginByWechat"
      ..vars.code = code
      ..vars.platform = GNextPlatform.PLATFORM_MOBILE);

    if (_wechatLoginStream == null) {
      _wechatLoginStream =
          GQL.executeQuery<GLoginByWeChatData, GLoginByWeChatVars>(
        loginByWechat,
        onData: (stream, response) {
          EasyLoading.dismiss();
          if (response.data?.loginByWeChat?.accessTokenString != null) {
            MuseEventUtil.getInstance().options?.userId =
                response.data!.loginByWeChat!.userID;
            MuseEventUtil.sendEvent(
              eventId: MuseEventUtil.SignInEventId,
              value: {
                "type": {"value": "weChatSignIn"},
                "userId": {"value": response.data!.loginByWeChat!.userID}
              },
            );
            SecureStorage.writeValue(
              key: 'token',
              value: response.data!.loginByWeChat!.accessTokenString!,
            ).then((_) async {
              await GQL.initClient();
              Global.userProvider.getUser();
              Navigator.popAndPushNamed(context, Routes.home);
            });
          }
        },
        onError: (stream, error) {
          EasyLoading.dismiss();
          showToast("登录失败");
        },
      );
    } else {
      GQL.ferryClient.requestController.add(loginByWechat);
    }
  }

  void _listenWechatCallback() {
    _wechatCallbackStream =
        weChatResponseEventHandler.distinct((a, b) => a == b).listen((res) {
      if (res is WeChatAuthResponse) {
        if (res.errCode == 0 && res.state == "rime" && res.code != null) {
          weChatSignInGraphQL(res.code!);
        } else if (res.errCode == -4) {
          showToast("退出登录");
        } else if (res.errCode == -2) {
          showToast("取消授权");
        }
      }
    });
  }

  void signInApple() {
    SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.fullName],
    ).then((value) {
      var query;
      String? name;

      if (value.familyName != null && value.givenName != null) {
        name = value.familyName ?? "" + value.givenName!;
      }

      if (value.familyName == null && value.givenName != null) {
        name = value.givenName!;
      }

      if (name != null) {
        query = GLoginWithAppleReq(
          (b) => b
            ..vars.identityToken = value.identityToken
            ..vars.userID = value.userIdentifier
            ..vars.name = name,
        );
      } else {
        query = GLoginWithAppleReq(
          (b) => b
            ..vars.identityToken = value.identityToken
            ..vars.userID = value.userIdentifier,
        );
      }

      EasyLoading.show(status: '加载中...', maskType: EasyLoadingMaskType.black);

      GQL.executeQuery<GLoginWithAppleData, GLoginWithAppleVars>(
        query,
        context: context,
        onData: (stream, data) {
          stream.cancel();
          EasyLoading.dismiss();
          if (data.data?.loginWithApple?.accessTokenString != null) {
            MuseEventUtil.getInstance().options?.userId =
                data.data!.loginWithApple!.userID;
            MuseEventUtil.sendEvent(
              eventId: MuseEventUtil.SignInEventId,
              value: {
                "type": {"value": "appleSignIn"},
                "userId": {"value": data.data!.loginWithApple!.userID}
              },
            );
            SecureStorage.writeValue(
              key: 'token',
              value: data.data!.loginWithApple!.accessTokenString!,
            ).then((_) async {
              await GQL.initClient();
              Global.userProvider.getUser();
              Navigator.popAndPushNamed(context, Routes.home);
            });
          }
        },
        onError: (stream, err) {
          stream.cancel();
          EasyLoading.dismiss();
          showToast("登录失败");
        },
      );
    });
  }

  Widget iconButton({
    required Color backgroundColor,
    required IconData icon,
    double? iconSize,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
        ),
        child: Center(
          child: Icon(
            icon,
            size: iconSize ?? 20.w,
            color: Pigment.fromString("#FFF"),
          ),
        ),
      ),
    );
  }

  Widget contentWidget() {
    int index = 0;
    if (_signInMethod == SignInMethod.WECHAT) index = 0;
    if (_signInMethod == SignInMethod.CELLPHONE) index = 1;
    if (_signInMethod == SignInMethod.EMAILPASSWORD) index = 2;
    return IndexedStack(
      index: index,
      children: [
        WeChatSignInWidget(disable: !isSelected),
        CellPhoneSignInWidget(disable: !isSelected),
        PasswordSignInWidget(disable: !isSelected)
      ],
    );
  }

  @override
  void initState() {
    _listenWechatCallback();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      String? appValue = LocalStorage.sharedPreferences.getString("app");
      if (appValue == null) {
        showDialog(
          context: context,
          builder: (context) {
            return NotifyDialog();
          },
          barrierDismissible: false,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _wechatCallbackStream?.cancel();
    _wechatLoginStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        color: Pigment.fromString("#FFF"),
        child: Column(
          children: [
            contentWidget(),
            SizedBox(height: 6.h),
            PrivacyWidget(onChange: (v) => setState(() => isSelected = v)),
            Spacer(),
            Text(
              "其他登录方式",
              style: bodyText1.copyWith(color: Pigment.fromString("#999")),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_signInMethod != SignInMethod.WECHAT)
                  iconButton(
                    backgroundColor: Pigment.fromString("#4CBF00"),
                    icon: MdiIcons.wechat,
                    iconSize: 24.sp,
                    onTap: () => setState(() {
                      _signInMethod = SignInMethod.WECHAT;
                    }),
                  ),
                if (_signInMethod != SignInMethod.WECHAT) SizedBox(width: 24.w),
                if (_signInMethod != SignInMethod.CELLPHONE)
                  iconButton(
                    backgroundColor: theme.primaryColor,
                    icon: MdiIcons.cellphone,
                    onTap: () => setState(() {
                      _signInMethod = SignInMethod.CELLPHONE;
                    }),
                  ),
                if (_signInMethod != SignInMethod.EMAILPASSWORD &&
                    _signInMethod != SignInMethod.CELLPHONE)
                  SizedBox(width: 24.w),
                if (_signInMethod != SignInMethod.EMAILPASSWORD)
                  iconButton(
                    backgroundColor: theme.primaryColor,
                    icon: MdiIcons.email,
                    onTap: () => setState(() {
                      _signInMethod = SignInMethod.EMAILPASSWORD;
                    }),
                  ),
                if (Platform.isIOS) SizedBox(width: 24.w),
                if (Platform.isIOS)
                  iconButton(
                    onTap: isSelected ? signInApple : null,
                    backgroundColor: Pigment.fromString("#000"),
                    icon: MdiIcons.apple,
                  ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
