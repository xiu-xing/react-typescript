import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class RealmConditionTip extends StatefulWidget {
  const RealmConditionTip({Key? key, required this.onTap}) : super(key: key);
  final void Function() onTap;

  @override
  RealmConditionTipState createState() => RealmConditionTipState();
}

class RealmConditionTipState extends State<RealmConditionTip> {
  int count = 0;

  void updateCount(int newCount) {
    setState(() => count = newCount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: count == 0 ? 0 : 36.h,
      child: Material(
        color: Pigment.fromString("#F5F6F9"),
        child: InkWell(
          onTap: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.tune,
                size: count == 0 ? 0 : 16.sp,
                color: Pigment.fromString("#666"),
              ),
              SizedBox(width: 2.w),
              Text(
                "$count 筛选条件",
                style: TextStyle(
                  color: Pigment.fromString("#666"),
                  fontSize: 14.sp,
                  fontFamily: notoSansSC,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
