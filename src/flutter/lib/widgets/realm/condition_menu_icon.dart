import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConditionMenuIcon extends StatefulWidget {
  const ConditionMenuIcon({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  FilterButtonState createState() => FilterButtonState();
}

class FilterButtonState extends State<ConditionMenuIcon> {
  bool disable = false;
  Color activeColor = primaryColor;

  void updateMenuButtonActiveColor(Color value) {
    setState(() => activeColor = value);
  }

  void updateMenuButtonState(bool value) {
    setState(() => disable = value);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          InkWell(
            onTap: disable ? null : widget.onTap,
            child: Container(
              width: 56.w,
              height: 44,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Icon(
                    MdiIcons.tune,
                    size: 20.w,
                    color: disable ? Pigment.fromString("#999") : activeColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
