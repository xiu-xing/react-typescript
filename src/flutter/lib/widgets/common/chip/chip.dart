import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';

class TextChip extends StatelessWidget {
  const TextChip({
    Key? key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: Material(
        color: isSelected ? theme.primaryColor : Pigment.fromString("#FFF"),
        borderRadius: BorderRadius.circular(18.h),
        child: InkWell(
          borderRadius: BorderRadius.circular(18.h),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.h),
              border: isSelected
                  ? null
                  : Border.all(color: Pigment.fromString("#EEE"), width: 1),
            ),
            child: Center(
              child: Text(
                text,
                style: bodyText1.copyWith(
                    height: 1.2,
                    color: isSelected
                        ? Pigment.fromString("#FFF")
                        : Pigment.fromString("#666")),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
