import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class StaticSearchField extends StatelessWidget {
  const StaticSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Pigment.fromString("#F5F6F9"),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 20.w,
            color: Pigment.fromString("#A6A6A6"),
          ),
          SizedBox(width: 2),
          Text(
            "搜索",
            style: TextStyle(
              fontSize: 14,
              color: Pigment.fromString(
                "#999",
              ),
              fontFamily: notoSansSC,
            ),
          ),
        ],
      ),
    );
  }
}
