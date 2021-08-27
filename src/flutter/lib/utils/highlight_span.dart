import 'package:flutter/material.dart';

/// 按关键字拆分拼接 一个样式
List<TextSpan> splitTextSpan(String content, List<String> keywords,
    {required TextStyle normalStyle, required TextStyle highlightStyle}) {
  return _splitTextSpan(content, keywords,
      index: 0, normalStyle: normalStyle, highlightStyle: highlightStyle);
}

/// 按关键字拆分拼接 和关键字对应的多个样式
List<TextSpan> splitTextSpanMix(String content, List<String> keywords,
    {required TextStyle normalStyle,
    required List<TextStyle> highlightStyles}) {
  if (keywords.length != highlightStyles.length) {
    throw FlutterError("keywords length not equal highlightStyles length");
  }

  return _splitTextSpanMix(content, keywords,
      index: 0, normalStyle: normalStyle, highlightStyles: highlightStyles);
}

List<TextSpan> _splitTextSpan(String content, List<String> keywords,
    {required int index,
    required TextStyle normalStyle,
    required TextStyle highlightStyle,
    List<TextStyle>? highlightStyles}) {
  List<TextSpan> spans = [];
  List<String> strList = content.split(keywords[index]);

  for (int i = 0; i < strList.length; i++) {
    String tmp = strList[i];

    if (keywords.length == 1 || index == keywords.length - 1) {
      if (tmp.isNotEmpty) spans.add(TextSpan(text: tmp, style: normalStyle));
    } else {
      if (tmp.isNotEmpty)
        spans.addAll(_splitTextSpan(tmp, keywords,
            index: index + 1,
            normalStyle: normalStyle,
            highlightStyle: highlightStyle,
            highlightStyles: highlightStyles));
    }

    if (i < strList.length - 1)
      spans.add(TextSpan(text: keywords[index], style: highlightStyle));
  }
  return spans;
}

List<TextSpan> _splitTextSpanMix(String content, List<String> keywords,
    {required int index,
    required TextStyle normalStyle,
    required List<TextStyle> highlightStyles}) {
  List<TextSpan> spans = [];
  List<String> strList = content.split(keywords[index]);

  for (int i = 0; i < strList.length; i++) {
    String tmp = strList[i];

    if (keywords.length == 1 || index == keywords.length - 1) {
      if (tmp.isNotEmpty) spans.add(TextSpan(text: tmp, style: normalStyle));
    } else {
      if (tmp.isNotEmpty)
        spans.addAll(_splitTextSpanMix(tmp, keywords,
            index: index + 1,
            normalStyle: normalStyle,
            highlightStyles: highlightStyles));
    }

    if (i < strList.length - 1)
      spans.add(TextSpan(text: keywords[index], style: highlightStyles[index]));
  }
  return spans;
}
