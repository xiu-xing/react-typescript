import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';

class Empty extends StatelessWidget {
  final EdgeInsets? margin;
  final String? text;
  final double? scale;
  final bool gqlConnectedError;
  final void Function()? reload;
  Empty({
    Key? key,
    this.text,
    this.margin,
    this.scale,
    this.gqlConnectedError = false,
    this.reload,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String errText = text ?? "暂无数据";
    if (gqlConnectedError == true) {
      errText = reload != null ? "网络请求失败，" : "网络请求失败";
    }
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * (scale ?? 0.4),
              height: MediaQuery.of(context).size.width * (scale ?? 0.4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(gqlConnectedError
                      ? 'assets/images/placeholder/nonetwork.png'
                      : 'assets/images/placeholder/nodata.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errText,
                  style: (scale != null && scale! < 0.5)
                      ? subtitle2
                      : subtitle1.copyWith(color: grey99),
                ),
                if (reload != null)
                  FlatTextButton(
                    width: 30,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    onTap: () {
                      reload!();
                    },
                    text: '重试',
                    textStyle: (scale != null && scale! < 0.5)
                        ? subtitle2.copyWith(
                            color: highlightColor,
                          )
                        : subtitle1.copyWith(
                            color: highlightColor,
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
