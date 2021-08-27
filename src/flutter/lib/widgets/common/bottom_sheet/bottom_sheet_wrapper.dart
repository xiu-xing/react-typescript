import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/bottom_sheet/bottom_actions.dart';

/// 弹窗外层
class BottomSheetWrapper extends StatelessWidget {
  final Widget body;
  final String title;
  final double totalHeight;
  final double bottomHeight;

  final VoidCallback onConfirm;
  final VoidCallback onReset;

  BottomSheetWrapper(
      {Key? key,
      required this.body,
      required this.title,
      required this.onConfirm,
      required this.onReset,
      required this.totalHeight,
      this.bottomHeight = 48.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: totalHeight,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 24.w, top: 24.h, bottom: 10.h),
            child: Row(
              children: [
                Text(title,
                    style: subtitle1.copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(child: body),
          BottomActions(
            height: bottomHeight,
            onRest: onReset,
            onConfirm: () {
              if (onConfirm is VoidCallback) {
                onConfirm();
              }
            },
          )
        ],
      ),
    );
  }
}
