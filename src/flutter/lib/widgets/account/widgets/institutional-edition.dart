import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';

class InstitutionalEditionButton extends StatefulWidget {
  InstitutionalEditionButton({Key? key}) : super(key: key);

  @override
  _InstitutionalEditionButtonState createState() =>
      _InstitutionalEditionButtonState();
}

class _InstitutionalEditionButtonState
    extends State<InstitutionalEditionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.w),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.w),
            topRight: Radius.circular(4.w),
          ),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/discovery/header-background.png",
            ),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: MaterialButton(
          elevation: 0,
          focusElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          splashColor: Colors.black.withOpacity(0.2),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: EdgeInsets.only(top: 16.w, bottom: 16.w),
          onPressed: () => router.navigateTo(context, Routes.verfication),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "投融数据全覆盖，申请试用机构版",
                style: bodyText1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 18.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
