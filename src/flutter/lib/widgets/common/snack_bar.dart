import 'package:flutter/material.dart';
import 'package:rime_app/theme.dart';

class SnackBarWidget {
  static TextStyle textStyle = TextStyle(fontFamily: notoSansSC);

  static final trackedFail = SnackBar(
    content: Text("追踪失败", style: textStyle),
  );

  static final unTrackedFail = SnackBar(
    content: Text("取消追踪失败", style: textStyle),
  );

  static SnackBar customText(String text) {
    return SnackBar(content: Text(text, style: textStyle));
  }
}
