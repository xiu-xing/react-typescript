import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/storage.dart';
import 'package:rime_app/widgets/authorization/text_field.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';

class PasswordSignInWidget extends StatefulWidget {
  const PasswordSignInWidget({
    Key? key,
    this.disable = false,
  }) : super(key: key);

  final bool disable;

  @override
  _PasswordSignInWidgetState createState() => _PasswordSignInWidgetState();
}

class _PasswordSignInWidgetState extends State<PasswordSignInWidget> {
  String emailAddress = "";
  String password = "";
  StreamSubscription? _streamPwdLogin;

  void signInByPassword() {
    EasyLoading.show(status: '加载中...', maskType: EasyLoadingMaskType.black);

    GLoginByPasswordReq request = GLoginByPasswordReq((b) => b
      ..requestId = 'signInByPassword'
      ..vars.account = emailAddress
      ..vars.password = password);

    if (_streamPwdLogin == null)
      _streamPwdLogin =
          GQL.executeQuery<GLoginByPasswordData, GLoginByPasswordVars>(
        request,
        onData: (s, r) {
          if (r.data?.loginByPassword != null) {
            MuseEventUtil.getInstance().options?.userId =
                r.data!.loginByPassword!.userID;
            MuseEventUtil.sendEvent(
              eventId: MuseEventUtil.SignInEventId,
              value: {
                "type": {"value": "passwordSignIn"},
                "userId": {"value": r.data!.loginByPassword!.userID}
              },
            );
            SecureStorage.writeValue(
              key: 'token',
              value: r.data!.loginByPassword!.accessTokenString!,
            ).then((_) async {
              await GQL.initClient();
              getUserInfo();
            });
          }
        },
        onError: (s, e) {
          if (EasyLoading.isShow) EasyLoading.dismiss();
          GQL.showErrorToast(e);
        },
      );
    else
      GQL.ferryClient.requestController.add(request);
  }

  void getUserInfo() {
    final getUser = GUserInfoReq((b) => b);

    GQL.executeQuery<GUserInfoData, GUserInfoVars>(
      getUser,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.user != null) {
          GUserInfoData_user user = res.data!.user!;
          Global.userProvider.setUser(user: user);
          Global.getuiPushUtil.setAlias(user.userID);

          if (EasyLoading.isShow) EasyLoading.dismiss();
          if (user.phone == null || user.phone == "")
            router.navigateTo(context, "${Routes.verifyPhone}", replace: true);
          else
            Navigator.popAndPushNamed(context, Routes.home);
        }
      },
      onError: (stream, err) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
        stream.cancel();
      },
    );
  }

  @override
  void dispose() {
    _streamPwdLogin?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510.h,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 72.h),
          Text(
            "账号密码登陆",
            style: TextStyle(
              fontFamily: notoSansSC,
              fontWeight: FontWeight.w500,
              color: Pigment.fromString("#333"),
              fontSize: 26.sp,
            ),
          ),
          SizedBox(height: 48.h),
          TextFieldWidget(
            contentPadding: EdgeInsets.only(
              left: 2.w,
              top: 12,
              bottom: 12,
            ),
            hintText: '邮箱',
            inputType: TextInputType.emailAddress,
            onChange: (value) {
              setState(() => emailAddress = value);
            },
          ),
          SizedBox(height: 40.h),
          TextFieldWidget(
            contentPadding: EdgeInsets.only(
              right: 2.w,
              top: 12,
              bottom: 12,
            ),
            obscureText: true,
            hintText: '密码',
            onChange: (value) {
              setState(() => password = value);
            },
          ),
          Spacer(),
          FlatTextButton(
            text: "登录",
            onTap: widget.disable
                ? null
                : emailAddress != "" && password != ""
                    ? signInByPassword
                    : null,
            width: 311.w,
            textStyle: headline2.copyWith(color: Pigment.fromString("#FFF")),
          ),
        ],
      ),
    );
  }
}
