import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.data.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.req.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.var.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/formatter.dart';
import 'package:rime_app/utils/storage.dart';
import 'package:rime_app/widgets/authorization/text_field.dart';
import 'package:rime_app/widgets/common/calculagraph.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';

class CellPhoneSignInWidget extends StatefulWidget {
  const CellPhoneSignInWidget({
    Key? key,
    this.disable = false,
  }) : super(key: key);

  final bool disable;

  @override
  _CellPhoneSignInWidgetState createState() => _CellPhoneSignInWidgetState();
}

class _CellPhoneSignInWidgetState extends State<CellPhoneSignInWidget> {
  List<String> areaCodes = ["+86", "+852", "+853", "+886"];
  String currentCode = "+86";
  String? phone;
  String? verificationCode;
  StreamSubscription? createCodeLinsener;
  StreamSubscription? verifyCodeLinsener;
  StreamSubscription? loginByOperationTokenLinsener;
  String codeToken = "";

  void createVerificationCode() {
    GCreateVerificationCodeReq request = GCreateVerificationCodeReq((b) => b
      ..requestId = "CreateVerificationCode"
      ..vars.contactInfo = "$currentCode$phone"
      ..vars.contactType = GContactType.PHONE);

    if (createCodeLinsener == null)
      createCodeLinsener = GQL.executeQuery<GCreateVerificationCodeData,
          GCreateVerificationCodeVars>(
        request,
        onData: (s, r) {
          if (r.data?.createVerificationCode == null) return;
          setState(() => codeToken = r.data!.createVerificationCode!);
        },
        onError: (s, e) {
          GQL.showErrorToast(e);
        },
      );
    else
      GQL.ferryClient.requestController.add(request);
  }

  void verifyCode() {
    EasyLoading.show(status: '加载中...', maskType: EasyLoadingMaskType.black);
    GVerifyCodeReq request = GVerifyCodeReq((b) => b
      ..requestId = "VerifyCode"
      ..vars.input.contactInfo = "$currentCode$phone"
      ..vars.input.contactType = GContactType.PHONE
      ..vars.input.verificationCode = verificationCode
      ..vars.input.tokenString = codeToken);

    if (verifyCodeLinsener == null)
      verifyCodeLinsener = GQL.executeQuery<GVerifyCodeData, GVerifyCodeVars>(
          request, onData: (s, r) {
        if (r.data?.verifyCode == null || r.data?.verifyCode == false) {
          showToast("验证码错误");
          return;
        }
        loginByOperationToken();
      }, onError: (s, e) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
        GQL.showErrorToast(e);
      });
    else
      GQL.ferryClient.requestController.add(request);
  }

  void loginByOperationToken() {
    GLoginByOperationTokenReq request = GLoginByOperationTokenReq((b) => b
      ..requestId = "LoginByOperationToken"
      ..vars.contactInfo = "$currentCode$phone"
      ..vars.contactType = GContactType.PHONE
      ..vars.operationToken = codeToken);

    if (loginByOperationTokenLinsener == null)
      loginByOperationTokenLinsener = GQL
          .executeQuery<GLoginByOperationTokenData, GLoginByOperationTokenVars>(
        request,
        onData: (s, r) {
          if (r.data?.loginByOperationToken != null) {
            MuseEventUtil.getInstance().options?.userId =
                r.data!.loginByOperationToken!.userID;
            MuseEventUtil.sendEvent(
              eventId: MuseEventUtil.SignInEventId,
              value: {
                "type": {"value": "operationTokenSignIn"},
                "userId": {"value": r.data!.loginByOperationToken!.userID}
              },
            );
            SecureStorage.writeValue(
              key: 'token',
              value: r.data!.loginByOperationToken!.accessTokenString!,
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
    createCodeLinsener?.cancel();
    verifyCodeLinsener?.cancel();
    loginByOperationTokenLinsener?.cancel();
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
            "短信验证登录",
            style: TextStyle(
              fontFamily: notoSansSC,
              fontWeight: FontWeight.w500,
              color: Pigment.fromString("#333"),
              fontSize: 26.sp,
            ),
          ),
          SizedBox(height: 48.h),
          Stack(
            children: [
              TextFieldWidget(
                contentPadding: EdgeInsets.only(
                  left: 60.w,
                  top: 12,
                  bottom: 12,
                ),
                hintText: '手机号',
                inputType: TextInputType.phone,
                onChange: (value) {
                  setState(() => phone = value);
                },
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return areaCodes
                      .map((code) => PopupMenuItem(
                            child: Text(code, textAlign: TextAlign.center),
                            value: code,
                          ))
                      .toList();
                },
                onSelected: (String value) {
                  setState(() => currentCode = value);
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentCode,
                        style: headline4.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SvgPicture.asset(
                        "assets/images/sign_in/menu_down.svg",
                        width: 18,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 40.h),
          Stack(
            children: [
              TextFieldWidget(
                contentPadding: EdgeInsets.only(
                  right: 120.w,
                  top: 12,
                  bottom: 12,
                ),
                hintText: '验证码',
                onChange: (v) {
                  setState(() => verificationCode = v);
                },
              ),
              SizedBox(
                height: 50,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Calculagraph(
                    disable: !Formatter.isPhone(phone),
                    onTap: () {
                      if (!Formatter.isPhone(phone)) {
                        showToast("请输入正确的手机号");
                      } else {
                        createVerificationCode();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          FlatTextButton(
            text: "登录",
            onTap: widget.disable
                ? null
                : Formatter.isPhone(phone) &&
                        verificationCode != null &&
                        verificationCode != ""
                    ? verifyCode
                    : null,
            width: 311.w,
            textStyle: headline2.copyWith(color: Pigment.fromString("#FFF")),
          ),
        ],
      ),
    );
  }
}
