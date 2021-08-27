import 'package:flutter/material.dart';
import 'package:rime_app/theme.dart';

class ACETabBarIndicator extends Decoration {
  // 指示器类型
  final ACETabBarIndicatorType type;
  final double height;
  final double lineWidth;
  final Color? color;

  ACETabBarIndicator(
      {this.type = ACETabBarIndicatorType.underline,
      required this.height,
      required this.lineWidth,
      this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _ACETabBarIndicatorPainter(
          this, type, height, lineWidth, color, onChanged);
}

class _ACETabBarIndicatorPainter extends BoxPainter {
  final ACETabBarIndicator decoration;
  ACETabBarIndicatorType type;
  double height, lineWidth;
  Color? color;

  _ACETabBarIndicatorPainter(this.decoration, this.type, this.height,
      this.lineWidth, this.color, VoidCallback? onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint()
      ..color = color ?? primaryColor
      ..style = PaintingStyle.fill;
    double _width = lineWidth;
//    final Rect rect = offset & configuration.size;
    double configurationHeight = configuration.size?.height ?? 0;
    double configurationWidth = configuration.size?.width ?? 0;
    switch (type) {
      case ACETabBarIndicatorType.runderline:
        canvas.drawLine(
            Offset(offset.dx, configurationHeight - height / 2),
            Offset(offset.dx + configurationWidth,
                configurationHeight - height / 2),
            _paint
              ..strokeWidth = height / 2
              ..strokeCap = StrokeCap.round);
        break;
      case ACETabBarIndicatorType.underline:
        if (_width > configurationWidth) _width = configurationWidth / 3;
        // +1
        canvas.drawLine(
          Offset(
            offset.dx + (configurationWidth - _width) / 2,
            configurationHeight - height / 2,
          ),
          Offset(
            offset.dx + (configurationWidth + _width) / 2,
            configurationHeight - height / 2,
          ),
          _paint
            ..strokeWidth = height / 2
            ..strokeCap = StrokeCap.square,
        );
        break;
    }
  }
}

enum ACETabBarIndicatorType {
  runderline, // 圆角下划线
  underline, // 普通下划线
}
