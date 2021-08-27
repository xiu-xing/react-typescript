import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/account/account.data.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.var.gql.dart';
import 'package:rime_app/graphql/mutations/account/account.req.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.data.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.req.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/formatter.dart';
import 'package:rime_app/widgets/common/dropdown_list.dart';
import 'package:rime_app/widgets/common/calculagraph.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';

class VirifyEmailDialog extends StatelessWidget {
  VirifyEmailDialog({Key? key, required this.domins})
      : assert(
          domins.length > 0,
        ),
        super(key: key);

  final List<String> domins;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Dialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0.w))),
        child: Container(
          height: 413.h,
          width: 0.86.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0.w)),
          ),
          child: SingleChildScrollView(
            child: DialogContent(
              domins: domins,
            ),
          ),
        ),
      ),
    );
  }
}

class DialogContent extends StatefulWidget {
  final List<String> domins;

  DialogContent({Key? key, required this.domins}) : super(key: key);

  @override
  _DialogContentState createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  final TextStyle errorTextStyle = bodyText2.apply(color: errorColor);
  String _name = "";
  String _emailPrefix = "";
  String _emailSuffx = "";
  String _verifyCode = "";
  String _tokenString = "";
  late TextEditingController _textEditingController;

  String get email => _emailPrefix + _emailSuffx;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController();
    _name = Global.userProvider.user?.userName ?? "";
  }

  Widget textContainer(String text, TextStyle style, EdgeInsets padding) {
    return Center(
      child: Container(
        padding: padding,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget textFieldContainer(
    String labelText, {
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    Widget? suffix,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    TextEditingController? controller,
    String? initialValue,
  }) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        style: bodyText1,
        initialValue: initialValue,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: bodyText1.copyWith(color: grey66),
          suffixIcon: suffix,
          contentPadding: contentPadding ?? EdgeInsets.zero,
          errorStyle: errorTextStyle,
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }

  _createVerifyCode(String email) {
    GQL.executeQuery<GCreateVerificationCodeData, GCreateVerificationCodeVars>(
      GCreateVerificationCodeReq(
        (b) => b
          ..vars.contactInfo = email
          ..vars.contactType = GContactType.EMAIL,
      ),
      onData: (stream, res) {
        stream.cancel();
        if (res.hasErrors) {
          showToast("获取验证码失败");
        }
        if (res.data?.createVerificationCode != null) {
          _tokenString = res.data!.createVerificationCode ?? "";
        }
      },
      onError: (stream, err) {
        stream.cancel();
        showToast("获取验证码失败");
      },
    );
  }

  _confirmButtonClick(
    String email,
    String name,
    String code,
    String tokenString,
  ) {
    GQL.executeQuery<GVerifyCodeData, GVerifyCodeVars>(
      GVerifyCodeReq(
        (b) => b
          ..vars.input.contactInfo = email
          ..vars.input.contactType = GContactType.EMAIL
          ..vars.input.tokenString = tokenString
          ..vars.input.verificationCode = code,
      ),
      onData: (stream, data) {
        stream.cancel();
        if (data.hasErrors) {
          showToast("验证码错误");
        }
        if (data.data != null && (data.data?.verifyCode ?? false)) {
          GQL.executeQuery<GBindContactData, GBindContactVars>(
            GBindContactReq((b) => b
              ..vars.contactInfo = email
              ..vars.contactType = GContactType.EMAIL
              ..vars.operationToken = code),
            onData: (stream, data) {
              stream.cancel();
              if (data.hasErrors) {
                showToast("请求错误");
              }
              if (data.data?.bindContact != null) {
                router.pop(context);
              }
            },
            onError: (stream, err) {
              stream.cancel();
              showToast("请求错误");
            },
          );
        }
      },
      onError: (stream, err) {
        stream.cancel();
        showToast("验证码错误");
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 48.h),
        textContainer(
          '应管理员要求，需完善个人信息',
          headline1.copyWith(fontWeight: FontWeight.w500, height: 1.25),
          EdgeInsets.symmetric(horizontal: 0.w),
        ),
        SizedBox(height: 8.h),
        textContainer(
          '有任何疑问，请咨询贵机构管理员',
          headline2.copyWith(color: grey73, height: 1.25),
          EdgeInsets.symmetric(horizontal: 0.w),
        ),
        SizedBox(height: 12.h),
        textFieldContainer(
          '真实姓名',
          initialValue: Global.userProvider.user?.userName ?? "",
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          onChanged: (value) {
            _name = value;
          },
        ),
        SizedBox(height: 12.h),
        Stack(
          children: [
            textFieldContainer(
              '邮箱',
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              contentPadding: EdgeInsets.only(bottom: 10.w, right: 90.w),
              onChanged: (value) {
                _emailPrefix = value;
              },
            ),
            Positioned(
              right: 30,
              bottom: 0,
              child: DropDownList(
                values: widget.domins,
                onChanged: (value) {
                  _emailSuffx = value;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        textFieldContainer(
          '验证码',
          controller: _textEditingController,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          suffix: Calculagraph(
            onTap: () {
              _textEditingController.clear();
              _createVerifyCode(email);
            },
          ),
          onChanged: (value) => _verifyCode = value,
          validator: (value) {
            if (value != "" && !Formatter.isCaptcha(value ?? "")) {
              return '验证码格式错误';
            }
            return null;
          },
        ),
        SizedBox(height: 30.h),
        FlatTextButton(
          text: "确认",
          onTap: () {
            _confirmButtonClick(email, _name, _verifyCode, _tokenString);
          },
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          textStyle: headline2.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
