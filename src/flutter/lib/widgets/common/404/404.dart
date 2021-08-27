import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class Empty404 extends StatelessWidget {
  Empty404({
    Key? key,
    this.margin,
    this.gqlConnectedError = false,
    this.reload,
  }) : super(key: key);

  final EdgeInsets? margin;
  final bool gqlConnectedError;
  final void Function()? reload;

  @override
  Widget build(BuildContext context) {
    String text = "啊哦～你想找的内容离你而去了哦  ";
    if (gqlConnectedError == true) {
      text = reload != null ? "网络请求失败，" : "网络请求失败";
    }
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 0.5.sw,
              height: 0.5.sw,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(gqlConnectedError
                      ? 'assets/images/placeholder/nonetwork.png'
                      : 'assets/images/placeholder/404.webp'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: subtitle1.copyWith(
                    color: Pigment.fromString('#A6A6A6FF'),
                  ),
                ),
                if (reload != null)
                  GestureDetector(
                    onTap: reload,
                    child: Text(
                      '重试',
                      style: subtitle1.copyWith(
                        color: highlightColor,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
