import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

/// 宽度填充，文字大小随文字数量自动缩小的文本
class Selection extends StatelessWidget {
  final String text;
  final bool select;
  final Function(int index) callback;
  final int index;
  final bool addRegion;

  const Selection(
      {Key? key,
      required this.text,
      required this.select,
      required this.callback,
      required this.index,
      this.addRegion = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.all(Radius.circular(2.w));
    return Material(
      borderRadius: radius,
      color: select ? primaryColor : backgroundLightColor,
      child: InkWell(
        onTap: () {
          this.callback(index);
        },
        borderRadius: radius,
        child: Container(
          height: 32.w,
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          child: _text(),
        ),
      ),
    );
  }

  Widget _text() {
    if (addRegion) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            size: 10.w,
            color: primaryColor,
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(
            text,
            style: bodyText2.copyWith(color: primaryColor),
          )
        ],
      );
    }
    // 缺点：无法限制缩小的下限制，文字过多时，需要...可改用AutoSizeText
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: bodyText2.copyWith(color: select ? Colors.white : hintColor),
        ));
  }
}
