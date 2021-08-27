import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

/// 选择：年份或日期
class DateRange extends StatefulWidget {
  final ValueChanged<String> onRangeConfirm;
  final String hint;
  final String value;
  final DatePickerMode pickerMode;
  final DateTime firstDateTime;
  final DateTime lastDateTime;

  DateRange({
    Key? key,
    required this.onRangeConfirm,
    required this.hint,
    required this.value,
    this.pickerMode = DatePickerMode.year,
    required this.firstDateTime,
    required this.lastDateTime,
  }) : super(key: key);

  @override
  _DateRangeState createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  DateTime? selectDate;

  @override
  void initState() {
    super.initState();
    if (widget.pickerMode == DatePickerMode.year)
      selectDate = widget.value.isEmpty
          ? DateTime.now()
          : DateTime(int.parse(widget.value));
  }

  @override
  Widget build(BuildContext context) {
    bool empty = widget.value.isEmpty;
    final radius = BorderRadius.all(Radius.circular(2.w));
    return Expanded(
      child: Material(
        color: backgroundLightColor,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: () {
            showPicker();
          },
          child: Container(
            height: Const.cellHeight,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            alignment: Alignment.centerLeft,
            child: Text(
              empty ? widget.hint : widget.value,
              style: bodyText2.copyWith(
                  color: empty ? disabledColor : hintColor,
                  fontWeight: empty ? FontWeight.w400 : FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  void showPicker() async {
    if (widget.pickerMode == DatePickerMode.year) {
      showDialog<DateTime>(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: 0.8.sw,
              height: 0.5.sh,
              child: StatefulBuilder(
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: YearPicker(
                          selectedDate: selectDate!,
                          // initialDate: selectDate,
                          firstDate: widget.firstDateTime,
                          lastDate: widget.lastDateTime,
                          onChanged: (date) {
                            state(() {
                              selectDate = date;
                            });
                          },
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerEnd,
                        constraints: const BoxConstraints(minHeight: 52.0),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: OverflowBar(
                          spacing: 8,
                          children: <Widget>[
                            TextButton(
                              child: Text("取消"),
                              onPressed: () {
                                widget.onRangeConfirm("");
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text("确认"),
                              onPressed: () {
                                widget.onRangeConfirm(
                                    selectDate!.year.toString());
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          );
        },
      );
    } else {
      DateTime initialDate =
          widget.value.isEmpty ? DateTime.now() : DateTime.parse(widget.value);
      if (initialDate.millisecond > widget.lastDateTime.millisecond)
        initialDate = widget.lastDateTime;

      DateTime? resultDateTime = await showDatePicker(
        context: context,
        initialDatePickerMode: widget.pickerMode,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: initialDate,
        firstDate: widget.firstDateTime,
        lastDate: widget.lastDateTime,
      );
      if (resultDateTime == null) {
        widget.onRangeConfirm("");
      } else {
        // to: 2021-06-11
        String res = resultDateTime.toString().substring(0, 10);
        widget.onRangeConfirm(res);
      }
    }
  }
}
