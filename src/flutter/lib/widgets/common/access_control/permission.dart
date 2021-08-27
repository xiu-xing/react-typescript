import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';

class Permission extends StatelessWidget {
  const Permission({Key? key}) : super(key: key);
  void navigatorToVerification(BuildContext context) {
    router.navigateTo(context, Routes.verfication);
  }

  Widget textWidget(String text) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 6.w),
          child: Icon(
            MdiIcons.checkboxBlankCircleOutline,
            color: Colors.white,
            size: 8.sp,
          ),
        ),
        Text(
          text,
          style: bodyText1.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 299.h,
      width: 270.w,
      padding: EdgeInsets.only(left: 24.w, top: 56.h, right: 24.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/access_control/bg.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.w)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "认证机构，查看全量数据",
            style: overline.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.h),
          textWidget("丰富的一级市场研究数据"),
          SizedBox(height: 8.h),
          textWidget("全面掌握市场新动态"),
          SizedBox(height: 8.h),
          textWidget("更多精彩等你来挖掘"),
          SizedBox(height: 45.h),
          InkWell(
            onTap: () {
              navigatorToVerification(context);
            },
            child: Row(
              children: [
                Text(
                  "立即验证",
                  style: subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 20.w,
                  height: 20.w,
                  margin: EdgeInsets.only(left: 6.w),
                  child: Image.asset(
                      "assets/images/access_control/arrow_right.png"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
