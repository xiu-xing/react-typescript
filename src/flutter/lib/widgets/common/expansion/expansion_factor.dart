import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';

/// 根据官方ExpansionTile，得到的百分比折叠方式
/// 对于折叠时所占高度比确定的布局，改变占比高度进行切换动画
class ExpansionFactor extends StatefulWidget {
  final String? title;
  final Widget? titleWidget;
  final double startPercentage;
  final Duration duration;
  final bool expend;
  final Widget child;

  @override
  ExpansionFactorState createState() => ExpansionFactorState();

  const ExpansionFactor(
      {Key? key,
      this.title,
      this.titleWidget,
      required this.startPercentage,
      this.duration = const Duration(milliseconds: 200),
      this.expend = false,
      required this.child})
      : super(key: key);
}

class ExpansionFactorState extends State<ExpansionFactor>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animationExpend;
  late Animation<double> _animationRotate;
  late AnimationController _controller;
  bool completed = false;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);

    if (widget.expend) {
      _animationRotate =
          Tween<double>(begin: 0.5, end: 0.0).animate(_controller);
      _animationExpend = Tween<double>(
              begin: 1.0,
              end: widget.startPercentage >= 1 ? 1 : widget.startPercentage)
          .animate(_controller);
    } else {
      _animationRotate =
          Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
      _animationExpend = Tween<double>(
              begin: widget.startPercentage >= 1 ? 1 : widget.startPercentage,
              end: 1.0)
          .animate(_controller);
    }
    super.initState();
  }

  void toggleExpend() {
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
            onTap: widget.startPercentage >= 1
                ? null
                : () {
                    toggleExpend();
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.titleWidget ??
                    Text(
                      widget.title ?? "",
                      style: bodyText1.copyWith(color: hintColor),
                    ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 14.w),
                  child: widget.startPercentage >= 1
                      ? SizedBox(
                          height: 20.w,
                        )
                      : RotationTransition(
                          turns: _animationRotate,
                          child: Icon(
                            MdiIcons.chevronDown,
                            // Icons.keyboard_arrow_down,
                            size: 20.w,
                            color: Pigment.fromString("#999"),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
        AnimatedBuilder(
            animation: _animationExpend,
            builder: (context, child) => ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: _animationExpend.value,
                    child: widget.child,
                  ),
                )),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
