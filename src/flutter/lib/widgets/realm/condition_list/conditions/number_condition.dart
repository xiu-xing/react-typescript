import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/models/realm_config/input.dart';
import 'package:rime_app/models/realm_config/option.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/range/base_range.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/range/number_range.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

/// input_type = RANGE
/// 可自定义输入数字 比如：融资金额，根据是否已有start end值限制另一个的上下限
/// 单选项
class NumberCondition extends StatefulWidget {
  final String title;
  final Input input;

  NumberCondition({Key? key, required this.title, required this.input})
      : super(key: key);

  @override
  _NumberConditionState createState() => _NumberConditionState();
}

class _NumberConditionState extends State<NumberCondition> {
  String start = "";
  String end = "";
  List<Option> list = [];
  String unit = "";
  UniqueKey? startKey;
  UniqueKey? endKey;

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
        Map<String, dynamic>? sourceTypeConfig = widget.input.sourceTypeConfig;
        if (sourceTypeConfig != null) {
          try {
            unit = sourceTypeConfig['unit']['name'];
          } catch (e) {
            print("unit get error ---- ${e.toString()}");
          }
        }
      } else {
        cellList.add(Selection(
            text: e.name, select: e.select, index: i++, callback: _checkCell));
      }
    });

    Widget? rangeInput;
    if (hasCustom) rangeInput = customInput();

    return BaseRange(
      title: widget.title,
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

  // 使用UniqueKey而不是ValueKey("start_$start")原因是
  // 比如: start=7end=7，输入start=33，此时输入框显示为33，数据被纠正为7，
  // 但由于而此时ValueKey(7)和上一次一致，而无法使显示数据为7
  Widget _tapStart() {
    return NumberRange(
      // key: ValueKey("start_$start"),
      key: startKey,
      unit: unit,
      hint: Const.startHint,
      value: start,
      onRangeConfirm: _setStartValue,
    );
  }

  Widget _tapEnd() {
    return NumberRange(
      key: endKey,
      unit: unit,
      hint: Const.endHint,
      value: end,
      onRangeConfirm: _setEndValue,
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
            startKey = UniqueKey();
            endKey = UniqueKey();
          }
          ++i;
        });
      });
    }
  }

  void _setStartValue(String value) {
    startKey = UniqueKey();
    if (value.isNotEmpty) {
      double tmp = Decimal.parse(value).toDouble();
      setState(() {
        list.forEach((element) {
          element.select = false;
          if (element.isCustomized) {
            if (element.end.isNotEmpty) {
              double max = double.parse(element.end);
              if (tmp > max) tmp = max;
            }
            // remove end .0
            element.start = Decimal.parse(tmp.toString()).toString();
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
    endKey = UniqueKey();
    if (value.isNotEmpty) {
      double tmp = Decimal.parse(value).toDouble();
      setState(() {
        list.forEach((element) {
          element.select = false;
          if (element.isCustomized) {
            if (element.start.isNotEmpty) {
              double min = double.parse(element.start);
              if (tmp < min) tmp = min;
            }
            // remove end .0
            element.end = Decimal.parse(tmp.toString()).toString();
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
