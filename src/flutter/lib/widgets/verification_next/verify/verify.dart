import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:rime_app/widgets/verification_next/verify/invitation_code.dart';
import 'package:rime_app/widgets/verification_next/verify/upload_business_card/upload_business_card.dart';

class Verified extends StatefulWidget {
  @override
  _VerifiedState createState() => _VerifiedState();

  Verified({
    Key? key,
    this.verifyMethod = VerifyMethod.invitationCode,
  }) : super(key: key);

  final VerifyMethod verifyMethod;
}

enum VerifyMethod {
  invitationCode,
  uploadBussinesCard,
}

class _VerifiedState extends State<Verified> {
  VerifyMethod currentVerifyMethod = VerifyMethod.invitationCode;

  // 联系方式 rich text
  Widget contactMethodWidget() {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "丁先生",
                style: bodyText1.copyWith(color: Pigment.fromString("#999")),
              ),
              TextSpan(
                text: "  18126050744",
                style: bodyText1.copyWith(color: Pigment.fromString("#666")),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Ink(
          width: 37.w,
          height: 20.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.w)),
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: '18126050744'))
                  .then((value) => showToast("复制成功"));
            },
            child: Center(
              child: Text(
                "复制",
                style: bodyText2.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 工作时间 rich text
  Widget timeLineTextWidget() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "周一至周五",
            style: bodyText1.copyWith(color: Pigment.fromString("#999")),
          ),
          TextSpan(
            text: " 09:00 - 18:00",
            style: bodyText1.copyWith(color: Pigment.fromString("#666")),
          ),
          TextSpan(text: "    "),
          TextSpan(
            text: "周六至周日",
            style: bodyText1.copyWith(color: Pigment.fromString("#999")),
          ),
          TextSpan(
            text: " 12:00 - 18:00",
            style: bodyText1.copyWith(color: Pigment.fromString("#666")),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() => currentVerifyMethod = widget.verifyMethod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppbar(
        customizable: true,
        leading: Container(
          margin: EdgeInsets.only(left: 16.w),
          height: 36.w,
          width: 36.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.w)),
          child: InkWell(
            borderRadius: BorderRadius.circular(18.w),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(MdiIcons.windowClose, size: 20.sp, color: normalColor),
          ),
        ),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "认证机构",
                      style: headline1.copyWith(fontSize: 20.sp),
                    ),
                    Text(
                      "换个账号？",
                      style: headline2.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // verifyMethodTextWidget(),
                Container(
                  height: 442.h,
                  child: currentVerifyMethod == VerifyMethod.invitationCode
                      ? VerifyByInvitationCodeWidget(
                          verifyMethodOnChange: (v) =>
                              setState(() => currentVerifyMethod = v),
                        )
                      : VerifyByUploadBusinessCard(
                          verifyMethodOnChange: (v) =>
                              setState(() => currentVerifyMethod = v),
                        ),
                ),
                Text(
                  "联系我们",
                  style:
                      bodyText1.copyWith(color: Pigment.fromString("#999999")),
                ),
                SizedBox(height: 4.h),
                contactMethodWidget(),
                SizedBox(height: 4.h),
                timeLineTextWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
