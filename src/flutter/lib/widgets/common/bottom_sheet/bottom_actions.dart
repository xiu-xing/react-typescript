import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';

/// 宽度平分按钮：重置|确认
class BottomActions extends StatelessWidget {
  final Function() onRest;
  final void Function()? onConfirm;
  final double height;

  const BottomActions(
      {Key? key, required this.onRest, this.onConfirm, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,
          color: greyEE,
        ),
        Row(
          children: [
            Expanded(
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: onRest,
                  child: Container(
                    height: height,
                    alignment: Alignment.center,
                    child: Text(
                      "重置",
                      style: headline2.copyWith(
                          color: greyA6, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: onConfirm == null
                    ? Pigment.fromString("#CCC")
                    : primaryColor,
                child: InkWell(
                  onTap: onConfirm,
                  child: Container(
                    height: height,
                    alignment: Alignment.center,
                    child: Text(
                      "确认",
                      style: headline2.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
