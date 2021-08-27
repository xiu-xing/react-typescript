import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

/// range base
class BaseRange extends StatelessWidget {
  final List<Widget> cellList;
  final Widget? rangeInput;
  final String title;

  BaseRange({
    Key? key,
    required this.title,
    required this.cellList,
    this.rangeInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: Const.leftMargin, right: Const.rightMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: bodyText1.copyWith(color: hintColor),
          ),
          SizedBox(height: 16.w),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Const.columnCount,
                mainAxisSpacing: Const.spacing,
                crossAxisSpacing: Const.spacing,
                childAspectRatio: Const.childAspectRatio),
            children: cellList,
          ),
          if (rangeInput != null)
            SizedBox(
              height: 12.w,
            ),
          if (rangeInput != null) rangeInput!
        ],
      ),
    );
  }
}
