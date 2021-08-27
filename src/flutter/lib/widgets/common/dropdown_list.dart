import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class DropDownList extends StatefulWidget {
  final List<String> values;
  final ValueChanged onChanged;

  DropDownList({
    Key? key,
    required this.values,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? currentValue;
  List<DropdownMenuItem<String>> dropdownMenuItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.values.isNotEmpty) {
      currentValue = widget.values.first;
      widget.onChanged(currentValue);
      widget.values.forEach((v) {
        dropdownMenuItems.add(DropdownMenuItem(
          child: Text(v, style: bodyText1),
          value: v,
          onTap: () {},
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.values.length == 1)
      return Container(
        margin: EdgeInsets.only(bottom: 12.w, right: 16.w),
        child: Text(widget.values[0], style: bodyText1),
      );

    return DropdownButton<String>(
      items: dropdownMenuItems,
      iconSize: 16.sp,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      hint: Text(currentValue!, style: bodyText1),
      value: currentValue,
      style: bodyText1,
      underline: Container(),
      onChanged: (selected) {
        setState(() => currentValue = selected);
        widget.onChanged(currentValue);
      },
    );
  }
}
