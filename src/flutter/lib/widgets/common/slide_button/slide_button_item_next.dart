import 'package:flutter/material.dart';
import 'package:rime_app/theme.dart';

class SlideButtonItem extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final TextStyle? style;
  final Color? backgrounColor;
  const SlideButtonItem({
    Key? key,
    this.onTap,
    this.text,
    this.style,
    this.backgrounColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: backgrounColor,
        child: Text(
          text!,
          style: style ?? bodyText1,
        ),
      ),
    );
  }
}
