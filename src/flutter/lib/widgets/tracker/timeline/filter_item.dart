import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/tags/selectable_tag.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackerTimelineFilterItem extends StatelessWidget {
  const TrackerTimelineFilterItem({
    Key? key,
    required this.text,
    required this.isSelect,
    this.onTap,
  }) : super(key: key);

  final String text;
  final bool isSelect;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.h, left: 12.w, bottom: 6.h),
      child: SelectableTag(
        text: text,
        isSelected: isSelect,
        backgroundColor: Pigment.fromString("#F8F8F8"),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        textStyle: subtitle2.copyWith(
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),
        selectedTextStyle: subtitle2.copyWith(
          color: theme.primaryColor,
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),
        selectedColor: theme.primaryColor.withOpacity(0.12),
        onTap: () {
          if (onTap != null) onTap!(text);
        },
      ),
    );
  }
}
