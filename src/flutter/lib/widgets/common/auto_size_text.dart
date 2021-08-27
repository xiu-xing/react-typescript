import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 文字大小根据限制的宽度自适应
/// 类似组件FittedBox
class AutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int minSize;
  final int maxLines;
  final TextAlign textAlign;

  AutoSizeText(this.text, this.textStyle,
      {Key? key,
      this.minSize = 8,
      this.maxLines = 1,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Text(
          text,
          style: _textStyle(constraints),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }

  TextStyle _textStyle(BoxConstraints constraints) {
    double startFontSize = textStyle.fontSize ?? 14;
    TextStyle style = textStyle;
    while (startFontSize >= minSize) {
      style = textStyle.copyWith(fontSize: startFontSize.sp);
      TextSpan span = TextSpan(text: text, style: style);
      if (_checkTextFits(span, constraints)) break;
      startFontSize--;
    }
    return style;
  }

  // 判断当前文字是否有超出行数显示
  bool _checkTextFits(TextSpan text, BoxConstraints constraints) {
    final wordWrapTextPainter = TextPainter(
      text: text,
      textAlign: textAlign,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    );

    wordWrapTextPainter.layout(maxWidth: constraints.maxWidth);

    if (wordWrapTextPainter.didExceedMaxLines ||
        wordWrapTextPainter.width > constraints.maxWidth) {
      return false;
    }
    return true;
  }
}
