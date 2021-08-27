import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiver/iterables.dart';

class LockIcon extends StatelessWidget {
  final double? size;

  final EdgeInsets padding;

  final EdgeInsets? marin;

  final VoidCallback? onTap;

  LockIcon({
    Key? key,
    this.size,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.marin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final roundSize = min([_size.width, _size.height]) ?? 0;

    Widget result = Padding(
      padding: padding,
      child: Image(
        image: AssetImage("assets/images/access_control/thunder.png"),
        width: size ?? 16.w,
        height: size ?? 16.w,
      ),
    );

    if (onTap != null) {
      result = Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(roundSize),
        child: InkWell(
          borderRadius: BorderRadius.circular(roundSize),
          onTap: onTap,
          child: Container(
            child: result,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return Container(
      margin: marin,
      child: result,
    );
  }
}