import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    this.onPress,
    this.underline = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPress;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Icon(
                  icon,
                  size: 24.sp,
                  color: grey33,
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.w),
                  decoration: BoxDecoration(
                    border: underline
                        ? Border(
                            bottom: BorderSide(
                            color: Pigment.fromString("#eee"),
                            width: 1,
                          ))
                        : null,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: subtitle1,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 24.sp,
                        color: grey66,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
