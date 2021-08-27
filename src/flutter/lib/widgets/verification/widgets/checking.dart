import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Checking extends StatefulWidget {
  Checking({Key? key, this.size}) : super(key: key);

  final double? size;

  @override
  _CheckingState createState() => _CheckingState();
}

class _CheckingState extends State<Checking>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.size!, widget.size!),
            painter: RadarPainter(_animation.value),
            child: CustomPaint(
              size: Size(widget.size!, widget.size!),
              painter: Painter(),
              child: SizedBox(
                height: widget.size,
                width: widget.size,
                child: Center(
                  child: Container(
                    width: widget.size! * 0.5,
                    height: widget.size! * 0.27,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          MdiIcons.account,
                          color: Pigment.fromString("#D1DCE1"),
                          size: 26.sp,
                        ),
                        Icon(
                          MdiIcons.formatListBulleted,
                          color: Pigment.fromString("#D1DCE1"),
                          size: 26.sp,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RadarPainter extends CustomPainter {
  RadarPainter(
    this.angle,
  );

  final double angle;

  final _paint = Paint()
    ..color = Colors.redAccent
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 1
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;

    final Rect rect =
        Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    _paint.shader = ui.Gradient.sweep(
      Offset(radius, radius),
      [
        Colors.white.withOpacity(.0),
        Pigment.fromString("#DCE6EF").withOpacity(0.17),
        Pigment.fromString("#98ABC9").withOpacity(0.17),
      ],
      [.0, .5, 1.0],
      TileMode.clamp,
      0,
      pi / 2,
    );

    canvas.save();
    double r = sqrt(pow(size.width, 2) + pow(size.height, 2));
    double startAngle = atan(size.height / size.width);
    Point p0 = Point(r * cos(startAngle), r * sin(startAngle));
    Point px = Point(r * cos(angle + startAngle), r * sin(angle + startAngle));
    canvas.translate((p0.x - px.x) / 2, (p0.y - px.y) / 2);
    canvas.rotate(angle);
    canvas.drawArc(rect, 0, pi / 2, true, _paint);
    // canvas.drawCircle(Offset(radius, radius), radius, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Painter extends CustomPainter {
  Painter({this.startGap = 16, this.gapWidth = 8});

  final double gapWidth;
  final double startGap;

  final _bgPaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;

    canvas.drawCircle(
      Offset(radius, radius),
      radius - startGap.w,
      _bgPaint
        ..shader = ui.Gradient.linear(
          Offset(radius, 0),
          Offset(radius, size.height),
          [
            Pigment.fromString("#DCE6EF").withOpacity(0.17),
            Pigment.fromString("#BFCADC").withOpacity(0.17),
          ],
        ),
    );
    canvas.drawCircle(
      Offset(radius, radius),
      radius - startGap.w - gapWidth.w,
      _bgPaint
        ..shader = ui.Gradient.linear(
          Offset(radius, 0),
          Offset(radius, size.height),
          [
            Pigment.fromString("#DCE6EF").withOpacity(0.42),
            Pigment.fromString("#BFCADC").withOpacity(0.42),
          ],
        ),
    );
    canvas.drawCircle(
      Offset(radius, radius),
      radius - startGap.w - gapWidth * 2.w,
      _bgPaint
        ..shader = ui.Gradient.linear(
          Offset(radius, 0),
          Offset(radius, size.height),
          [
            Pigment.fromString("#DCE6EF"),
            Pigment.fromString("#BFCADC"),
          ],
        ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
