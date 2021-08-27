import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/models/realm_config/input.dart';
import 'package:rime_app/models/realm_config/option.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/range/base_range.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/range/date_range.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';
import 'package:rime_app/widgets/realm/utils/string_to_date.dart';

/// input_type = DATE_RANGE
/// 可自定义选择年份或年月范围，根据是否已有start end值限制另一个的上下限
/// 单选项
class DateCondition extends StatefulWidget {
  final Input input;

  DateCondition({Key? key, required this.input}) : super(key: key);

  @override
  _DateConditionState createState() => _DateConditionState();
}

class _DateConditionState extends State<DateCondition> {
  String start = "";
  String end = "";
  List<Option> list = [];
  DatePickerMode? pickerMode;

  @override
  void initState() {
    super.initState();
    list = widget.input.inputTypeConfig?.options ?? [];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cellList = [];
    bool hasCustom = false;
    int i = 0;
    list.forEach((e) {
      if (e.isCustomized) {
        hasCustom = true;
        start = e.start;
        end = e.end;
        pickerMode = e.datePickerType == Const.datePickerTypeYear
            ? DatePickerMode.year
            : DatePickerMode.day;
      } else {
        cellList.add(Selection(
            text: e.name, select: e.select, index: i++, callback: _checkCell));
      }
    });

    Widget? rangeInput;
    if (hasCustom) rangeInput = customInput();

    return BaseRange(
      title: widget.input.name,
      cellList: cellList,
      rangeInput: rangeInput,
    );
  }

  Widget customInput() {
    return Row(
      children: [
        _tapStart(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: SizedBox(
            width: 13.w,
            height: 1,
            child: ColoredBox(
              color: disabledColor,
            ),
          ),
        ),
        _tapEnd(),
      ],
    );
  }

  Widget _tapStart() {
    final DateTime lastDateTime;
    if (end.isEmpty) {
      lastDateTime = DateTime.now();
    } else {
      lastDateTime = stringToDate(end, pickerMode!);
    }

    return DateRange(
      hint: Const.startDateHint,
      value: start,
      onRangeConfirm: _setStartValue,
      pickerMode: pickerMode!,
      firstDateTime: DateTime(1900),
      lastDateTime: lastDateTime,
    );
  }

  Widget _tapEnd() {
    final DateTime firstDateTime;
    if (start.isEmpty) {
      firstDateTime = DateTime(1900);
    } else {
      firstDateTime = stringToDate(start, pickerMode!);
    }

    return DateRange(
      hint: Const.endDateHint,
      value: end,
      onRangeConfirm: _setEndValue,
      pickerMode: pickerMode!,
      firstDateTime: firstDateTime,
      lastDateTime: DateTime.now(),
    );
  }

  void _checkCell(int index) {
    if (!list[index].select) {
      int i = 0;
      setState(() {
        list.forEach((element) {
          element.select = i == index;
          if (element.isCustomized) {
            element.start = "";
            element.end = "";
          }
          ++i;
        });
      });
    }
  }

  void _setStartValue(String value) {
    if (value.isNotEmpty) {
      setState(() {
        list.forEach((element) {
          element.select = false;
          if (element.isCustomized) {
            element.start = value;
          }
        });
      });
    } else {
      setState(() {
        list.firstWhere((element) {
          if (element.isCustomized) {
            element.start = value;
            return true;
          }
          return false;
        });
      });
    }
  }

  void _setEndValue(String value) {
    if (value.isNotEmpty) {
      setState(() {
        list.forEach((element) {
          element.select = false;
          if (element.isCustomized) {
            element.end = value;
          }
        });
      });
    } else {
      setState(() {
        list.firstWhere((element) {
          if (element.isCustomized) {
            element.end = value;
            return true;
          }
          return false;
        });
      });
    }
  }
}
