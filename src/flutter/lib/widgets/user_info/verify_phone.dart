import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/formatter.dart';
import 'package:rime_app/widgets/authorization/text_field.dart';
import 'package:rime_app/widgets/common/calculagraph.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({Key? key}) : super(key: key);

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  List<String> areaCodes = ["+86", "+852", "+853", "+886"];
  String currentCode = "+86";
  String? phone;
  String? verificationCode;
  StreamSubscription? createCodeLinsener;
  StreamSubscription? verifyCodeLinsener;
  StreamSubscription? updateUserInfomationLinsener;
  String codeToken = "";

  void createVerificationCode() {
    var request = GCreateVerificationCodeForBindingContactReq((b) => b
      ..requestId = "CreateVerificationCodeForBindingContact"
      ..vars.contactInfo = "$currentCode$phone"
      ..vars.contactType = GContactType.PHONE);

    if (createCodeLinsener == null)
      createCodeLinsener = GQL.executeQuery<
          GCreateVerificationCodeForBindingContactData,
          GCreateVerificationCodeForBindingContactVars>(
        request,
        onData: (s, r) {
          if (r.data?.createVerificationCodeForBindingContact == null) return;
          setState(() {
            codeToken = r.data!.createVerificationCodeForBindingContact!;
          });
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
      ..requestId = "VerifyCodeWithChecking"
      ..vars.input.contactInfo = "$currentCode$phone"
      ..vars.input.contactType = GContactType.PHONE
      ..vars.input.verificationCode = verificationCode
      ..vars.input.tokenString = codeToken);

    if (verifyCodeLinsener == null)
      verifyCodeLinsener = GQL.executeQuery<GVerifyCodeData, GVerifyCodeVars>(
          request, onData: (s, r) {
        if (r.data?.verifyCode == null || r.data?.verifyCode == false) {
          if (EasyLoading.isShow) EasyLoading.dismiss();
          showToast("验证码错误");
          return;
        }
        bindContact();
      }, onError: (s, e) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
        GQL.showErrorToast(e);
      });
    else
      GQL.ferryClient.requestController.add(request);
  }

  void bindContact() {
    GBindContactReq request = GBindContactReq((b) => b
      ..requestId = "BindContact"
      ..vars.contactInfo = "$currentCode$phone"
      ..vars.contactType = GContactType.PHONE
      ..vars.operationToken = codeToken);

    if (updateUserInfomationLinsener == null)
      GQL.executeQuery<GBindContactData, GBindContactVars>(request,
          onData: (s, r) {
        s.cancel();
        if (EasyLoading.isShow) EasyLoading.dismiss();
        if (r.data?.bindContact == null) return;
        var userInfo = r.data!.bindContact!;
        Global.userProvider.setUser(
          phone: userInfo.phone,
          avatarURL: userInfo.avatarURL,
          description: userInfo.description,
          role: userInfo.role,
          userID: userInfo.userID,
          userName: userInfo.userName,
          email: userInfo.email,
        );
        router.navigateTo(
          context,
          "${Routes.userProfile}?place=verifyPhone",
          replace: true,
        );
      }, onError: (s, e) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
        GQL.showErrorToast(e);
        s.cancel();
      });
  }

  Widget areaCodeSelector() {
    return PopupMenuButton(
      itemBuilder: (context) {
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
            SvgPicture.asset("assets/images/sign_in/menu_down.svg", width: 18),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    createCodeLinsener?.cancel();
    verifyCodeLinsener?.cancel();
    updateUserInfomationLinsener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 72.h),
            Text(
              "验证手机",
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
                areaCodeSelector(),
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
                  onChange: (value) {
                    setState(() => verificationCode = value);
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
              text: "验证",
              onTap: verifyCode,
              width: 311.w,
              textStyle: headline2.copyWith(color: Pigment.fromString("#FFF")),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
