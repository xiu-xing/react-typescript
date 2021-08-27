import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class Header extends StatelessWidget {
  final TextAlign? textAlign;
  const Header({Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/discovery/header-background.png"),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.w, left: 24.w, right: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: textAlign == TextAlign.center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/discovery/LOGO.svg', height: 16.h),
            SizedBox(height: 8.h),
            Text(
              "用数据赋能决策，让数据垂手可得",
              style: TextStyle(
                color: Pigment.fromString("#fff"),
                fontSize: 14.sp,
                fontFamily: notoSansSC,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
