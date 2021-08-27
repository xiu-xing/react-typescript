import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';

class ListItemWrapper extends StatelessWidget {
  const ListItemWrapper({
    Key? key,
    this.padding,
    required this.child,
    this.divider = false,
  }) : super(key: key);
  final EdgeInsets? padding;
  final Widget child;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(left: 16.w, top: 14.h),
      decoration: BoxDecoration(
        border: divider
            ? Border(
                bottom: BorderSide(
                    color: Pigment.fromString("#EEEEEE"), width: 1.h),
              )
            : Border(),
      ),
      child: child,
    );
  }
}
