import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.data.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.req.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/restart_widget.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/formatter.dart';
import 'package:rime_app/widgets/common/circular_progress/circular_progress.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:rime_app/widgets/verification/widgets/count_down/count_down.dart';
import 'package:rime_app/widgets/verification_next/verify/upload_business_card/business_card_container.dart';
import 'package:rime_app/widgets/verification_next/verify/verify.dart';

class VerifyByUploadBusinessCard extends StatefulWidget {
  final void Function(VerifyMethod) verifyMethodOnChange;

  VerifyByUploadBusinessCard({
    Key? key,
    required this.verifyMethodOnChange,
  }) : super(key: key);

  @override
  _VerifyByUploadBusinessCardState createState() =>
      _VerifyByUploadBusinessCardState();
}

class _VerifyByUploadBusinessCardState
    extends State<VerifyByUploadBusinessCard> {
  String _localCardUrl = '';
  File? _cardImg;
  TicketStatus? _activeStep;
  String _phone = "";
  String _verificationCode = "";
  String _tokenString = "";
  TextEditingController _textEditingController = new TextEditingController();

  Future<String> _saveImage(File file) async {
    String url = await GQL.dioUpload(file).catchError((e) => throw e);

    return url;
  }

  void _createTicket(String url) {
    GCreateBusinessCardApprovalTicketReq mutation =
        GCreateBusinessCardApprovalTicketReq(
      (b) => b..vars.businessCardUrl = url,
    );

    GQL.executeQuery<GCreateBusinessCardApprovalTicketData,
        GCreateBusinessCardApprovalTicketVars>(
      mutation,
      context: context,
      onData: (stream, res) {
        stream.cancel();

        if (res.data?.createBussinessCardApprovalTicket != null &&
            res.data?.createBussinessCardApprovalTicket == true) {
          setState(() => _activeStep = TicketStatus.Pending);
        }
      },
      onError: (stream, err) {
        stream.cancel();
        if (err.first.message.contains("Duplicate submissions")) {
          showToast("请勿重复上传", position: ToastPosition.center);
          return;
        }
        showToast("上传失败");
      },
    );
  }

  void _upload() async {
    if (_cardImg == null) return;
    if (_cardImg!.lengthSync() > 8 * 1024 * 1024) {
      showToast("文件太大", position: ToastPosition.center);
      return;
    }

    String url = await _saveImage(_cardImg!).catchError((_) {
      showToast("上传名片失败,请检查名片格式。", position: ToastPosition.center);
    });

    if (url == "") {
      showToast("上传名片失败,请检查名片格式。", position: ToastPosition.center);
      return;
    }

    _createTicket(url);
  }

  void _verifyCode(String phone, String code, String tokenString) async {
    GVerifyCodeAndApproveJoinRequestReq mutation =
        GVerifyCodeAndApproveJoinRequestReq(
      (b) => b
        ..vars.input.contactType = GContactType.PHONE
        ..vars.input.verificationCode = code
        ..vars.input.contactInfo = phone
        ..vars.input.tokenString = tokenString,
    );

    GQL.executeQuery<GVerifyCodeAndApproveJoinRequestData,
        GVerifyCodeAndApproveJoinRequestVars>(
      mutation,
      context: context,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.verifyCodeAndApproveJoinRequest != null &&
            res.data?.verifyCodeAndApproveJoinRequest == true) {
          RestartWidget.restartApp(context);
        }
      },
      onError: (stream, err) {
        showToast("验证码错误");
        stream.cancel();
      },
    );
  }

  void _createVerificationCode(String phone) {
    GCreateVerificationCodeByJoinRequestReq mutation =
        GCreateVerificationCodeByJoinRequestReq(
      (b) => b..vars.contactType = GContactType.PHONE,
    );

    GQL.executeQuery<GCreateVerificationCodeByJoinRequestData,
        GCreateVerificationCodeByJoinRequestVars>(
      mutation,
      context: context,
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.createVerificationCodeByJoinRequest != null) {
          _tokenString = res.data?.createVerificationCodeByJoinRequest ?? "";
        }
      },
      onError: (stream, err) {
        stream.cancel();
      },
    );
  }

  Widget verifyMethodTextWidget() {
    switch (_activeStep!) {
      case TicketStatus.UnUpload:
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "输入邀请码",
                style:
                    headline1.copyWith(color: Theme.of(context).primaryColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      widget.verifyMethodOnChange(VerifyMethod.invitationCode),
              ),
              TextSpan(
                text: " 或 上传名片 完成机构认证",
                style: headline1.copyWith(color: Pigment.fromString("#737373")),
              ),
            ],
          ),
        );
      case TicketStatus.Pending:
        return Text(
          "我们正在审核您的信息，请耐心等待",
          style: headline1.copyWith(color: Pigment.fromString("#666")),
        );
      case TicketStatus.Failed:
        return Text(
          "很抱歉，您的机构审核不通过",
          style: headline1.copyWith(color: Pigment.fromString("#666")),
        );
      case TicketStatus.Success:
        return Text(
          "请验证手机完成认证，解锁更多功能",
          style: headline1.copyWith(color: Pigment.fromString("#737373")),
        );
    }
  }

  Widget wrapper({
    required Widget contentWidget,
    void Function()? buttonOnTap,
    required String buttonText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verifyMethodTextWidget(),
        SizedBox(height: 32.h),
        contentWidget,
        SizedBox(height: 64.h),
        FlatTextButton(
          onTap: buttonOnTap,
          text: buttonText,
          height: 47.h,
          textStyle: subtitle1.copyWith(color: Colors.white),
        )
      ],
    );
  }

  Widget content() {
    switch (_activeStep!) {
      case TicketStatus.UnUpload:
        return wrapper(
          contentWidget: BusinessCardContainer(
            images: [
              "assets/images/verification/upload_fail.webp",
              "assets/images/verification/upload_step_2.webp"
            ],
            cardImgOnChange: (image) {
              setState(() {
                _cardImg = image;
                _localCardUrl = image.path;
              });
            },
          ),
          buttonText: "下一步",
          buttonOnTap: _localCardUrl == '' ? null : _upload,
        );
      case TicketStatus.Pending:
        return wrapper(
            contentWidget: BusinessCardContainer(
              images: ["assets/images/verification/upload_loading.webp"],
            ),
            buttonText: "下一步",
            buttonOnTap: null);
      case TicketStatus.Failed:
        return wrapper(
            contentWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BusinessCardContainer(
                  images: [
                    "assets/images/verification/upload_fail.webp",
                    "assets/images/verification/upload_step_2.webp"
                  ],
                  cardImgOnChange: (image) {
                    setState(() {
                      _cardImg = image;
                      _localCardUrl = image.path;
                    });
                  },
                ),
                if (Global.userProvider.ticketDetail?.msg != null)
                  SizedBox(height: 4.h),
                if (Global.userProvider.ticketDetail?.msg != null)
                  Text(
                    "不通过原因: ${Global.userProvider.ticketDetail?.msg}",
                    style: bodyText1,
                  )
              ],
            ),
            buttonText: "重新上传",
            buttonOnTap: _localCardUrl == '' ? null : _upload);
      case TicketStatus.Success:
        return wrapper(
            contentWidget: Column(
              children: [
                TextFormField(
                  readOnly: true,
                  focusNode: null,
                  keyboardType: TextInputType.phone,
                  initialValue: _phone,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontFamily: notoSansSC,
                      color: Pigment.fromString("#737373"),
                      fontSize: 18.sp,
                    ),
                    labelText: '手机号',
                  ),
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  autocorrect: true,
                  controller: _textEditingController,
                  inputFormatters: [LengthLimitingTextInputFormatter(6)],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CountDown(
                            onTap: () {
                              _textEditingController.clear();
                              _createVerificationCode(_phone);
                            },
                          )
                        ],
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontFamily: notoSansSC,
                      color: Pigment.fromString("#737373"),
                      fontSize: 18.sp,
                    ),
                    labelText: '验证码',
                    errorStyle: bodyText2.apply(color: errorColor),
                  ),
                  validator: (value) {
                    if (value != "" && !Formatter.isCaptcha(value ?? "")) {
                      return '验证码格式错误';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _verificationCode = value;
                    });
                  },
                ),
              ],
            ),
            buttonText: "完成",
            buttonOnTap: Formatter.isCaptcha(_verificationCode)
                ? () => _verifyCode(_phone, _verificationCode, _tokenString)
                : null);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() => _activeStep = Global.userProvider.ticketStatus);
    setState(() => _phone = Global.userProvider.ticketDetail?.phone ?? "");
  }

  @override
  Widget build(BuildContext context) {
    if (_activeStep == null) {
      return CircularProgress(size: 24.sp);
    }

    return content();
  }
}
