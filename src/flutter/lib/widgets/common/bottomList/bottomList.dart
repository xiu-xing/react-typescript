import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomList extends StatelessWidget {
  final List<String> tabs;
  final List<Function> onTaps;

  BottomList({
    Key? key,
    required this.tabs,
    required this.onTaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (tabs.length * 65.0).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ...tabs.asMap().keys.map((index) {
            return InkWell(
              onTap: () {
                if (onTaps.length > index) onTaps[index]();
              },
              child: Container(
                decoration: new BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffE4E7EB))),
                ),
                width: double.maxFinite,
                height: 65.h,
                padding: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Text(tabs[index],
                    style: headline2.copyWith(
                        fontWeight: FontWeight.w600, color: disabledColor)),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
