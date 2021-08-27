import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/models/action/action.dart';
import 'package:rime_app/models/rich_text_next/rich_text_next.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/utils/action.dart';

/// 目前只支持 plain， break_line 其他类型请自行添加
class RichTextNext extends StatefulWidget {
  const RichTextNext({
    Key? key,
    required this.models,
    this.entityName,
    this.textStyle,
    this.maxLines,
    this.canFold = false,
  }) : super(key: key);

  final List<RichTextNextModel> models;
  final String? entityName;
  final TextStyle? textStyle;
  final int? maxLines;
  final bool? canFold;

  @override
  _RichTextNextState createState() => _RichTextNextState();
}

class _RichTextNextState extends State<RichTextNext> {
  bool isExpansion = false;

  bool isTextOverflow() {
    TextPainter _textPainter = TextPainter(
        maxLines: widget.maxLines,
        text: TextSpan(
          children: List.generate(
            widget.models.length,
            (i) => TextSpan(text: widget.models[i].value),
          ),
          style: TextStyle(
            fontSize: widget.textStyle?.fontSize ?? 14.sp,
            fontFamily: notoSansSC,
          ),
        ),
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0.0, maxWidth: MediaQuery.of(context).size.width);
    if (_textPainter.didExceedMaxLines)
      return true;
    else
      return false;
  }

  InlineSpan richTextItem(BuildContext context, RichTextNextModel model) {
    switch (model.pattern) {
      case "plain":
        ActionModel? action = model.action;
        return plainTextWidget(model.value, action: action);
      case "break_line":
        return TextSpan(text: "\n");
    }
    return WidgetSpan(child: SizedBox());
  }

  TextSpan plainTextWidget(String text, {ActionModel? action}) {
    Color textColor = widget.textStyle?.color ?? Pigment.fromString('#333');
    if (action != null) textColor = theme.primaryColor;
    return TextSpan(
      text: text,
      style: TextStyle(
        color: textColor,
        fontSize: widget.textStyle?.fontSize ?? 14.sp,
        fontWeight: widget.textStyle?.fontWeight,
        fontFamily: notoSansSC,
      ),
      recognizer: action != null
          ? (TapGestureRecognizer()
            ..onTap = () => FluroUtil.navigatorByAction(
                  context,
                  tapAction: action,
                  entityName: widget.entityName,
                  title: text,
                ))
          : null,
    );
  }

  WidgetSpan foldPlainTextWidget(String text, {ActionModel? action}) {
    return WidgetSpan(
      child: Column(
        children: [
          RichText(
            maxLines: widget.maxLines,
            text: plainTextWidget(text, action: action),
          ),
          SizedBox(height: 2.h),
          InkWell(
            onTap: () => setState(() => isExpansion = !isExpansion),
            child: Icon(
              MdiIcons.chevronDown,
              size: 20.w,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget richText() {
    return RichText(
      maxLines: isExpansion ? null : (widget.maxLines ?? 100),
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: List.generate(
          widget.models.length,
          (i) => richTextItem(context, widget.models[i]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.canFold == true)
      return Column(
        children: [
          richText(),
          if (isTextOverflow())
            InkWell(
              onTap: () => setState(() => isExpansion = !isExpansion),
              child: Icon(
                isExpansion ? MdiIcons.chevronUp : MdiIcons.chevronDown,
                size: 20.w,
                color: theme.primaryColor,
              ),
            ),
        ],
      );

    return richText();
  }
}
