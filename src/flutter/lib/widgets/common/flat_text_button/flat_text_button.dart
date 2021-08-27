import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlatTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final EdgeInsets? margin;
  final double borderRadius;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? disableColor;
  final TextStyle? disableTextStyle;
  final Alignment textAlignment;
  final Widget? prefix;

  FlatTextButton({
    Key? key,
    required this.text,
    this.borderRadius = 4,
    this.height,
    this.width,
    this.onTap,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.textStyle,
    this.disableColor,
    this.disableTextStyle,
    this.textAlignment = Alignment.center,
    this.prefix,
  }) : super(key: key);

  Widget textWidget() {
    return Text(
      text,
      style: onTap == null
          ? (disableTextStyle ?? textStyle ?? headline2)
          : (textStyle ??
              headline2.copyWith(
                color: Pigment.fromString("#999"),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size(width ?? double.maxFinite, height ?? 47.w),
          padding: padding ?? EdgeInsets.symmetric(vertical: 2.0.h),
          primary: Colors.white,
          alignment: textAlignment,
          backgroundColor: onTap == null
              ? (disableColor ?? Pigment.fromString('#CCCCCC'))
              : (backgroundColor ?? Theme.of(context).primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onTap,
        child: prefix != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [prefix!, textWidget()],
              )
            : textWidget(),
      ),
    );
  }
}
