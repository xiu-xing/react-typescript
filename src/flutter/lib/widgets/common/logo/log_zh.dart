import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RimeLogoZH extends StatelessWidget {
  const RimeLogoZH({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/rimedata_zh.webp"),
      width: 185.w,
      height: 22.w,
    );
  }
}
