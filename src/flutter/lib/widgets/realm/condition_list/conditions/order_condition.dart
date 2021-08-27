import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection.dart';
import 'package:rime_app/widgets/realm/models/order_column.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

/// orderColumns
/// 排序条件，单选项
class OrderCondition extends StatefulWidget {
  final String title;
  final List<OrderColumnModel> orderColumns;

  OrderCondition({Key? key, required this.title, required this.orderColumns})
      : super(key: key);

  @override
  _OrderConditionState createState() => _OrderConditionState();
}

class _OrderConditionState extends State<OrderCondition> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cellList = [];
    int i = 0;
    widget.orderColumns.forEach((e) {
      cellList.add(Selection(
          text: e.name, select: e.select, index: i++, callback: _checkCell));
    });

    return Padding(
      padding:
          EdgeInsets.only(left: Const.leftMargin, right: Const.rightMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: bodyText1.copyWith(color: hintColor),
          ),
          SizedBox(height: 16.w),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Const.columnCount,
                mainAxisSpacing: Const.spacing,
                crossAxisSpacing: Const.spacing,
                childAspectRatio: Const.childAspectRatio),
            children: cellList,
          ),
        ],
      ),
    );
  }

  void _checkCell(int index) {
    if (!widget.orderColumns[index].select) {
      int i = 0;
      setState(() {
        widget.orderColumns.forEach((element) {
          element.select = i == index;
          ++i;
        });
      });
    }
  }
}
