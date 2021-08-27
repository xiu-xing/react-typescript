import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);

  final TextStyle text1 = TextStyle(
    color: Pigment.fromString("#666"),
    fontSize: 14.sp,
    height: 1.15,
    fontFamily: notoSansSC,
  );
  final TextStyle text2 = TextStyle(
    color: Pigment.fromString("#999"),
    fontSize: 14.sp,
    height: 1.15,
    fontFamily: notoSansSC,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "联系我们",
            style: text2,
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Text(
                "丁先生",
                style: text2,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "18126050744",
                style: text1,
              ),
              SizedBox(
                width: 12.w,
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: '18126050744'))
                      .then((value) => showToast("复制成功"));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0.w),
                      border: Border.all(color: primaryColor, width: 1)),
                  child: Text(
                    "复制",
                    style: TextStyle(
                      color: primaryColor,
                      fontFamily: notoSansSC,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Wrap(
            children: [
              Text(
                "周一至周五 ",
                style: text2,
              ),
              Text(
                "09:00 - 18:00",
                style: text1,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "周六至周日 ",
                style: text2,
              ),
              ..."12:00 - 18:00"
                  .split("")
                  .map(
                    (e) => Text(
                      e,
                      style: text1,
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
