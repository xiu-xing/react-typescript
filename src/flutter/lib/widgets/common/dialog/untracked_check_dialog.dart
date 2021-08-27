import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';

class UnTrackedCheckDialog extends StatelessWidget {
  const UnTrackedCheckDialog({
    Key? key,
    this.name = "",
    this.onSubmit,
  }) : super(key: key);
  final String name;
  final void Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0.w))),
      child: Container(
        height: 0.20.sh,
        width: 270.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "不再追踪"),
                            TextSpan(
                              text: name,
                              style:
                                  headline2.copyWith(color: theme.primaryColor),
                            )
                          ],
                          style: headline2,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: greyEE,
                ),
                Material(
                  color: Colors.transparent,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(width: 0.5, color: greyEE)),
                          ),
                          child: InkWell(
                            onTap: () async {
                              router.pop(context);
                            },
                            child: SizedBox(
                              height: 40.h,
                              child: Center(
                                  child: Text(
                                "取消",
                                style: bodyText1,
                              )),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(width: 0.5, color: greyEE)),
                          ),
                          child: InkWell(
                            onTap: () {
                              router.pop(context);
                              if (onSubmit != null) onSubmit!();
                            },
                            child: SizedBox(
                              height: 40.h,
                              child: Center(
                                  child: Text(
                                "确定",
                                style:
                                    bodyText1.copyWith(color: highlightColor),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
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
