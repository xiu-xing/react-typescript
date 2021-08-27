import 'package:flutter/material.dart';
import 'package:rime_app/widgets/common/expansion/expansion_factor.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

class SelectionGrid extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool expend;

  const SelectionGrid(
      {Key? key,
      required this.title,
      required this.children,
      this.expend = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 超过初始显示限制数量时，计算限制高度的占总高百分百
    int rowCount = (children.length / Const.columnCount).ceil();
    double startPercentage = 1;
    if (rowCount > Const.rowLimit) {
      double totalHeight =
          (rowCount - 1) * Const.spacing + rowCount * Const.cellHeight;
      double limitHeight =
          Const.rowLimit * (Const.cellHeight + Const.spacing) - Const.spacing;
      startPercentage = limitHeight / totalHeight;
    }

    return Padding(
      padding:
          EdgeInsets.only(left: Const.leftMargin, right: Const.rightMargin),
      child: ExpansionFactor(
        // 添加数据的情况，startPercentage 变化时刷新
        key: ValueKey("startPercentage_$startPercentage"),
        expend: expend,
        title: title,
        startPercentage: startPercentage,
        child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Const.columnCount,
              mainAxisSpacing: Const.spacing,
              crossAxisSpacing: Const.spacing,
              childAspectRatio: Const.childAspectRatio),
          children: children,
        ),
      ),
    );
  }
}
