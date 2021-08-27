import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';

/// 对于折叠和展开时高度不确定的布局，传入两种情况的widget进行切换动画
/// 只传入firstChild，则只多一个标题
class ExpansionSwitch extends StatefulWidget {
  final String? title;
  final Duration duration;
  final bool expend;
  final Widget firstChild;
  final Widget? secondChild;

  const ExpansionSwitch(
      {Key? key,
      this.title,
      this.duration = const Duration(milliseconds: 200),
      this.expend = false,
      required this.firstChild,
      this.secondChild})
      : super(key: key);

  @override
  ExpansionSwitchState createState() => ExpansionSwitchState();
}

class ExpansionSwitchState extends State<ExpansionSwitch>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animationRotate;
  late AnimationController _controller;
  late bool expend;
  bool completed = false;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    expend = widget.expend;

    if (widget.expend) {
      _animationRotate =
          Tween<double>(begin: 0.5, end: 0.0).animate(_controller);
    } else {
      _animationRotate =
          Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
    }
    super.initState();
  }

  void toggleExpend() {
    setState(() {
      expend = !expend;
    });
    if (completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    completed = !completed;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: widget.secondChild == null
                ? null
                : () {
                    toggleExpend();
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title ?? "",
                  style: bodyText1.copyWith(height: lineHeight1_71),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 12.w, bottom: 14.w),
                    child: widget.secondChild == null
                        ? SizedBox(
                            height: 20.w,
                          )
                        : RotationTransition(
                            turns: _animationRotate,
                            child: Icon(
                              MdiIcons.chevronDown,
                              size: 20.w,
                              color: Pigment.fromString("#666"),
                            ),
                          )),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          alignment: Alignment.topLeft,
          firstChild: widget.firstChild,
          secondChild: widget.secondChild ?? widget.firstChild,
          duration: widget.duration,
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState:
              expend ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
