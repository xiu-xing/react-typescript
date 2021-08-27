import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.onChange,
    this.contentPadding,
    this.hintText,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);
  final ValueChanged<String>? onChange;
  final EdgeInsets? contentPadding;
  final String? hintText;
  final TextInputType inputType;
  final bool obscureText;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode _focusNode = new FocusNode();
  bool _hasFocus = false;
  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _hasFocus ? theme.primaryColor : Pigment.fromString("#EEE"),
            width: 1,
          ),
        ),
      ),
      child: TextField(
        style: headline4,
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: widget.inputType,
        // controller: _accountController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          labelStyle: headline4.copyWith(
            color: Pigment.fromString('#A6A6A6'),
          ),
          labelText: widget.hintText,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onChanged: widget.onChange,
        obscureText: widget.obscureText,
      ),
    );
  }
}
