import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/invitation_code_verification/invitation_code_verification.data.gql.dart';
import 'package:rime_app/graphql/mutations/invitation_code_verification/invitation_code_verification.req.gql.dart';
import 'package:rime_app/graphql/mutations/invitation_code_verification/invitation_code_verification.var.gql.dart';
import 'package:rime_app/restart_widget.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/storage.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:rime_app/widgets/verification_next/verify/verify.dart';

class VerifyByInvitationCodeWidget extends StatefulWidget {
  final void Function(VerifyMethod) verifyMethodOnChange;

  VerifyByInvitationCodeWidget({
    Key? key,
    required this.verifyMethodOnChange,
  }) : super(key: key);

  @override
  _VerifyByInvitationCodeWidgetState createState() =>
      _VerifyByInvitationCodeWidgetState();
}

class _VerifyByInvitationCodeWidgetState
    extends State<VerifyByInvitationCodeWidget> {
  String invitationCode = "";
  bool fetching = false;

  void onConfirm() {
    if (invitationCode.length < 6) {
      return;
    }
    EasyLoading.show(
      status: '加载中...',
      maskType: EasyLoadingMaskType.black,
    );

    GQL.executeQuery<GInvitationCodeVerifyData, GInvitationCodeVerifyVars>(
      GInvitationCodeVerifyReq((b) => b
        ..requestId = "invitation_code_verify"
        ..vars.code = invitationCode),
      onData: (s, r) {
        EasyLoading.dismiss();
        s.cancel();
        if (r.data?.invitationCodeVerification.accessTokenString != null) {
          String token = r.data!.invitationCodeVerification.accessTokenString!;
          SecureStorage.writeValue(key: 'token', value: token)
              .then((_) => RestartWidget.restartApp(context));
        }
      },
      onError: (s, e) {
        EasyLoading.dismiss();
        s.cancel();
        String errMessage = "加入失败，请稍后再试！";
        int index = e.indexWhere(
            (element) => element.message.contains("Exhaustion of purchases"));
        if (index != -1) {
          errMessage = "已达人数上限，请联系管理员！";
          return;
        }
        final snackBar = SnackBar(content: Text(errMessage));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }

  Widget verifyMethodTextWidget() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "输入邀请码 或 ",
            style: headline1.copyWith(color: Pigment.fromString("#737373")),
          ),
          TextSpan(
            text: "上传名片",
            style: headline1.copyWith(color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  widget.verifyMethodOnChange(VerifyMethod.uploadBussinesCard),
          ),
          TextSpan(
            text: " 完成机构认证",
            style: headline1.copyWith(color: Pigment.fromString("#737373")),
          ),
        ],
      ),
    );
  }

  // 邀请码输入框
  Widget codeInput() {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Pigment.fromString("#F5F6F9"),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Center(
        child: TextField(
          enabled: true,
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: "请输入邀请码",
            hintStyle: subtitle1.copyWith(color: disabledColor),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              invitationCode = value;
            });
          },
        ),
      ),
    );
  }

  Widget confirmButton() {
    return Container(
      height: 184.h,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 144.h,
              width: 247.w,
              child: Image(
                image: AssetImage(
                  "assets/images/verification/bg.webp",
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FlatTextButton(
              text: "完成",
              height: 47.h,
              textStyle: subtitle1.copyWith(color: Colors.white),
              onTap: invitationCode != "" ? onConfirm : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verifyMethodTextWidget(),
        SizedBox(height: 32.h),
        codeInput(),
        SizedBox(height: 80.h),
        confirmButton(),
      ],
    );
  }
}
