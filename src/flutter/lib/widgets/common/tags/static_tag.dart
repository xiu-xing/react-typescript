import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaticTag extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? height;
  final EdgeInsets? margin;

  StaticTag({
    Key? key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.padding,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
          color: backgroundColor ?? theme.primaryColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(2.h)),
      height: height ?? 25.h,
      constraints: BoxConstraints(maxWidth: 0.7.sw),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Text(
        text,
        style: textStyle ??
            bodyText2.copyWith(
              color: theme.primaryColor,
              height: 1.3,
            ),
      ),
    );
  }
}
