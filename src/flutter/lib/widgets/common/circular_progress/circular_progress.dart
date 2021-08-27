import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class CircularProgress extends StatelessWidget {
  final double? size;
  final EdgeInsets? margin;
  final double strokeWidth;
  final Color? color;
  final double? width;
  final double? height;
  CircularProgress(
      {Key? key,
      this.size,
      this.margin,
      this.strokeWidth = 2,
      this.color,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin ?? EdgeInsets.all(5.w),
        height: size ?? 32.w,
        width: size ?? 32.w,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? primaryColor),
        ),
      ),
    );
  }
}
