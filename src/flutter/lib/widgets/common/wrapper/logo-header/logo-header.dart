import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'header.dart';

class LogoHeaderWrapper extends StatelessWidget {
  final Widget? child;
  final TextAlign? textAlign;

  const LogoHeaderWrapper({
    Key? key,
    this.child,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: [
          Header(textAlign: textAlign),
          Padding(
            padding: EdgeInsets.only(top: 97.h),
            child: Container(
                decoration: BoxDecoration(
                  color: Pigment.fromString("#fff"),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                child: child),
          ),
        ],
      ),
    );
  }
}
