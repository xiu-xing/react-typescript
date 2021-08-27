import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class SelectableTag extends StatelessWidget {
  final String text;

  final bool isSelected;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? selectedColor;
  final void Function()? onTap;
  final double? height;

  SelectableTag({
    Key? key,
    required this.text,
    this.textStyle,
    this.selectedTextStyle,
    this.padding,
    this.backgroundColor,
    this.selectedColor,
    required this.isSelected,
    this.onTap,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(2.w),
      color: isSelected
          ? (selectedColor ?? highlightColor)
          : (backgroundColor ?? backgroundDarkColor),
      child: InkWell(
        borderRadius: BorderRadius.circular(2.w),
        onTap: onTap ?? null,
        child: Container(
          height: height ?? 25.w,
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 2.w,
              ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: isSelected
                ? (selectedTextStyle ??
                    subtitle1.copyWith(
                      color: Colors.white,
                      fontSize: 13.sp,
                      height: 1.5,
                    ))
                : (textStyle ??
                    subtitle1.copyWith(
                      color: disabledColor,
                      fontSize: 13.sp,
                      height: 1.5,
                    )),
          ),
        ),
      ),
    );
  }
}
