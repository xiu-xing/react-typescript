import 'package:flutter/material.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubSearchInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Widget? suffixIcon;
  final String? hintText;
  const SubSearchInput({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.suffixIcon,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        autofocus: false,
        maxLines: 1,
        enableInteractiveSelection: true,
        style: bodyText1,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon,
          fillColor: backgroundLightColor,
          hintText: hintText,
          hintStyle: bodyText1.copyWith(color: disabledColor),
          contentPadding: EdgeInsets.only(left: 16.w),
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4.w),
          ),
        ),
      ),
    );
  }
}
