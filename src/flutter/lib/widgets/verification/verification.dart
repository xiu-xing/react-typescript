import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/graphql/queries/business_card/business_card.data.gql.dart';
import 'package:rime_app/graphql/queries/business_card/business_card.req.gql.dart';
import 'package:rime_app/graphql/queries/business_card/business_card.var.gql.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.data.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.req.gql.dart';
import 'package:rime_app/graphql/mutations/business_card/business_card.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/utils/formatter.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:rime_app/widgets/common/bottomList/bottomList.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';
import 'package:rime_app/widgets/common/stepper/custom_stepper.dart';
import 'package:rime_app/widgets/verification/widgets/count_down/count_down.dart';
import 'package:rime_app/widgets/verification/widgets/cropImage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/checking.dart';
import 'widgets/contact_us.dart';

class Verification extends StatefulWidget {
  Verification({
    Key? key,
    this.status,
    this.returnable = true,
  }) : super(key: key);

  final TicketStatus? status;
  final bool returnable;

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification>
    with WidgetsBindingObserver {
  final List<String> steps = ["认证机构", "信息审核", "信息验证"];
  int _activeStep = 0;
  String _phone = "";
  String _reason = "";
  String _localCardUrl = '';
  File? _cardImg;
  String _verificationCode = "";
  String _tokenString = "";

  TextEditingController _textEditingController = new TextEditingController();

  final TextStyle titleStyle = TextStyle(
    fontSize: 26.sp,
    fontFamily: notoSansSC,
    fontWeight: FontWeight.w500,
  );

  final TextStyle subTitleStyle = TextStyle(
    color: Pigment.fromString("#666"),
    fontSize: 18.sp,
    fontFamily: notoSansSC,
    fontWeight: FontWeight.w500,
  );

  final TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontFamily: notoSansSC,
    fontWeight: FontWeight.w400,
  );

  final TextStyle errorTextStyle = bodyText2.apply(color: errorColor);

  void getBusinessCardDetail() {
    GQL.executeQuery<GBusinessCardDetailData, GBusinessCardDetailVars>(
      GBusinessCardDetailReq(),
      onData: (stream, res) {
        stream.cancel();
        if (res.data?.bussinessCardDetail != null) {
          if (res.data?.bussinessCardDetail.joinStatus ==
              GJoinStatus.JoinSubmit) {
            _activeStep = 1;
          }
          if (res.data?.bussinessCardDetail.joinStatus == GJoinStatus.JoinEnd &&
              res.data?.bussinessCardDetail.success == true) {
            _activeStep = 2;
          }
          if (res.data?.bussinessCardDetail.joinStatus == GJoinStatus.JoinEnd &&
              res.data?.bussinessCardDetail.success == false) {
            _activeStep = 0;
          }
          if (mounted) {
            setState(() {});
          }
        }
      },
      onError: (stream, err) => stream.cancel(),
    );
  }

  @override
  void initState() {
    if (widget.status == null) {
      getBusinessCardDetail();
    } else {
      _activeStep = convertTicketStatus(widget.status!);
    }
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // getClipboardDatas().then((code) {
      //   if (code != "" && code.length != 0) {
      //     router.navigateTo(context, "${Routes.invitation}?code=$code");
      //   }
      // });
    }
  }

  int convertTicketStatus(TicketStatus state) {
    switch (state) {
      case TicketStatus.UnUpload:
        return 0;
      case TicketStatus.Failed:
        return 0;
      case TicketStatus.Pending:
        return 1;
      case TicketStatus.Success:
        return 2;
      default:
        return 0;
    }
  }

  void _handleNext() {
    if (_activeStep < steps.length) {
      setState(() {
        _activeStep += 1;
      });
      context.read<UserProvider>().getBusinessCardDetail();
    }
  }

  Future<String> _saveImage(File file) async {
    String url = await GQL.dioUpload(file).catchError((e) => throw e);

    if (url == "") {
      return Future.error("上传名片失败");
    }

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
        if (res.hasErrors) {
          showToast("上传失败");
        }
        stream.cancel();

        if (res.data?.createBussinessCardApprovalTicket != null &&
            res.data?.createBussinessCardApprovalTicket == true) {
          _handleNext();
        }
      },
      onError: (stream, err) {
        stream.cancel();
        if (err.first.message.contains("Duplicate submissions")) {
          showToast("重复上传", position: ToastPosition.center);
        }
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
          // Global.userProvider.updateAccessToken(context, false);
          // Future.delayed(
          //     Duration(milliseconds: 500), () => Navigator.pop(context));
        }
      },
      onError: (stream, err) {
        showToast("验证码错误");
        stream.cancel();
      },
    );
  }

  int _checkInRange(int index) {
    if (index >= steps.length - 1) {
      index = steps.length - 1;
    }
    return index;
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomList(
          tabs: ["从相册上传", "拍照上传"],
          onTaps: [chooseImage, takePhoto],
        );
      },
    );
  }

  // 从相册去取图片
  Future chooseImage() async {
    router.pop(context);
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        cropImage(File(image.path));
      }
    });
  }

  /// 拍摄照片取照片
  Future takePhoto() async {
    router.pop(context);
    await ImagePicker().getImage(source: ImageSource.camera).then((image) {
      if (image != null) {
        cropImage(File(image.path));
      }
    });
  }

  // 裁剪图片 用 callback 返回一个图片 File 类文件到副组件用于上传
  void cropImage(File originalImage) async {
    File result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CropImage(originalImage)));

    if (result.path != '') {
      setState(() {
        _cardImg = result;
        _localCardUrl = result.path;
      });
    }
  }

  void _upload() async {
    if (_cardImg == null) return;
    if (_cardImg!.lengthSync() > 8 * 1024 * 1024) {
      showToast("文件太大", position: ToastPosition.center);
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

  Widget _buildTitle() {
    int _index = _checkInRange(_activeStep);

    return Container(
      padding: EdgeInsets.only(top: 4.h, left: 16.w),
      alignment: Alignment.centerLeft,
      child: Text(
        steps[_index],
        style: TextStyle(
          fontSize: 20.sp,
          fontFamily: notoSansSC,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _flatButton(
    void Function() onPressed,
    String text, {
    EdgeInsets? padding,
    Color? color,
    TextStyle? style,
  }) {
    return FlatTextButton(
      padding: padding ?? EdgeInsets.all(12.w),
      backgroundColor: color ?? Theme.of(context).primaryColor,
      disableColor: Pigment.fromString("#CCC"),
      onTap: onPressed,
      text: text,
      textStyle: style ?? buttonText,
    );
  }

  Widget rejectResonWidget() {
    if (_reason == "") {
      return Container();
    }
    String text = "抱歉，由于：" + _reason + ", 名片审核不通过，请重新提交，谢谢。";
    return Text(
      text,
      style: bodyText1.copyWith(color: errorColor),
    );
  }

  List<Widget> _buildContent(BuildContext context, UserProvider provider) {
    int _index = _checkInRange(_activeStep);
    _phone = provider.ticketDetail?.phone ?? "";
    _reason = provider.ticketDetail?.msg ?? "";

    List<Widget> step1 = <Widget>[
      Text(
        "只需上传名片，查看全量数据解锁更多功能",
        style: subTitleStyle,
      ),
      rejectResonWidget(),
      SizedBox(height: 20.h),
      Center(
        child: GestureDetector(
          onTap: () => _showBottomSheet(),
          child: AspectRatio(
            aspectRatio: 304 / 171,
            child: _localCardUrl == ''
                ? Image(
                    image: AssetImage('assets/images/upload.webp'),
                    fit: BoxFit.fill,
                  )
                : Image(
                    image: FileImage(_cardImg!),
                    fit: BoxFit.fill,
                  ),
          ),
        ),
      ),
      Spacer(),
      SizedBox(height: 4.h),
      _flatButton(_cardImg == null ? () {} : _upload, "下一步"),
      Spacer(),
      ContactUs()
    ];
    List<Widget> step2 = <Widget>[
      Text(
        "我们正在审核您的信息，请耐心等待...",
        style: subTitleStyle,
      ),
      Spacer(),
      Center(child: Checking(size: 168.w)),
      Spacer(),
      SizedBox(height: 4.h),
      _flatButton(() {}, "下一步"),
      // Center(
      //   child: GestureDetector(
      //     onTap: () {
      //       print("cancel");
      //     },
      //     child: Text(
      //       "取消审核",
      //       style: TextStyle(
      //         fontSize: 14,
      //         color: Theme.of(context).primaryColor,
      //       ),
      //     ),
      //   ),
      // ),
      Spacer(),
      ContactUs()
    ];
    List<Widget> step3 = <Widget>[
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
          errorStyle: errorTextStyle,
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
      Spacer(),
      SizedBox(height: 4.h),
      _flatButton(
          Formatter.isCaptcha(_verificationCode)
              ? () => _verifyCode(_phone, _verificationCode, _tokenString)
              : () {},
          "完成"),
      Spacer(),
      ContactUs()
    ];

    List<List<Widget>> content = [step1, step2, step3];

    return content[_index];
  }

  Widget _contentWidget() {
    return Consumer<UserProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: CustomStepper(
                  allSteps: steps.length,
                  activeStep: _activeStep,
                ),
              ),
              ..._buildContent(context, provider),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: widget.returnable
          ? CommonAppbar(
              elevation: 0,
              customizable: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30.h),
                child: _buildTitle(),
              ),
            )
          : CommonAppbar(
              elevation: 0,
              customizable: true,
              leading: _buildTitle(),
              actions: [
                InkWell(
                  radius: 2.w,
                  borderRadius: BorderRadius.all(Radius.circular(2.0.w)),
                  onTap: () {
                    // SecureStorage.deleteValue(key: 'token');
                    // String userID = Global.userProvider.user?.userID;
                    // if (userID != null && userID != "") {
                    //   String alias = userID.replaceAll('-', '_');

                    //   if (Platform.isIOS) {
                    //     Global.getuiPushUtil.iOSSetAlias(alias);
                    //   } else {
                    //     Global.getuiPushUtil.deleteAilas(alias);
                    //   }
                    // }
                    // router.navigateTo(context, Routes.signIn, replace: true);
                    router.pop(context);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                    child: Text(
                      "暂时跳过",
                      style: caption.copyWith(height: 1.15),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
      body: _contentWidget(),
    );
  }
}
