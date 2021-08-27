import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RimeLogo extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const RimeLogo({
    Key? key,
    this.width = 130,
    this.height = 20,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      height: height.h,
      width: width.w,
      color: color ?? primaryColor,
    );
  }
}
