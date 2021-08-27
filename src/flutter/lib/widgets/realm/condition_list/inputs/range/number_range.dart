import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

/// 宽度填充，限制输入数字，可小数
class NumberRange extends StatefulWidget {
  final ValueChanged<String> onRangeConfirm;
  final String hint;
  final String value;
  final String unit;

  NumberRange(
      {Key? key,
      required this.onRangeConfirm,
      required this.hint,
      required this.value,
      required this.unit})
      : super(key: key);

  @override
  _NumberRangeState createState() => _NumberRangeState();
}

class _NumberRangeState extends State<NumberRange> with WidgetsBindingObserver {
  DateTime? selectDate;
  TextEditingController? _textEditingController;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.value);
    _focusNode.addListener(listener);
    WidgetsBinding.instance?.addObserver(this);
    keyBoardShow = false;
  }

  void listener() {
    if (!_focusNode.hasFocus) {
      widget.onRangeConfirm(_textEditingController?.text ?? "");
    }
  }

  bool keyBoardShow = false;

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // 针对安卓输入法使用右上角关闭软键盘而没失去焦点的处理
      if (Platform.isAndroid && _focusNode.hasFocus) {
        final bottom = MediaQuery.of(context).viewInsets.bottom;
        if (bottom == 0) {
          if (keyBoardShow) {
            keyBoardShow = false;
            // 使输入框失去焦点
            _focusNode.unfocus();
          }
        } else {
          keyBoardShow = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundLightColor,
          borderRadius: BorderRadius.circular(2.w),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: Const.cellHeight,
        child: Row(
          children: [
            Expanded(
              child: _input(),
            ),
            Text(
              widget.unit,
              style: bodyText2,
            )
          ],
        ),
      ),
    );
  }

  Widget _input() {
    return TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(20),
        // 暂未限制小数数量
        FilteringTextInputFormatter.allow(RegExp(r'^\d+.?\d*')),
        // FilteringTextInputFormatter.allow(RegExp(r'^\d+.?\d{0,2}')),
      ],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      controller: _textEditingController,
      autofocus: false,
      maxLines: 1,
      enableInteractiveSelection: true,
      style: bodyText2.copyWith(fontWeight: FontWeight.w500),
      focusNode: _focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundLightColor,
        hintText: widget.hint,
        hintStyle: bodyText2.copyWith(
          color: disabledColor,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 5.w),
        alignLabelWithHint: true,
        helperStyle: subtitle2,
        enabledBorder: textFieldBorder(),
        focusedBorder: textFieldBorder(),
      ),
    );
  }

  InputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _textEditingController?.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
