import 'package:flutter/material.dart';
import 'package:rime_app/models/realm_config/input.dart';
import 'package:rime_app/models/realm_config/option.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection_grid.dart';

/// 第一个为本地固定添加的“全部”需特殊处理，多选
class SelectionCondition extends StatefulWidget {
  final Input input;

  SelectionCondition({
    Key? key,
    required this.input,
  }) : super(key: key);

  @override
  _SelectionConditionState createState() => _SelectionConditionState();
}

class _SelectionConditionState extends State<SelectionCondition> {
  List<Option> list = [];

  @override
  void initState() {
    super.initState();
    list = widget.input.inputTypeConfig?.options ?? [];
    if (list.isNotEmpty && !list.first.isLocalAddAll()) {
      list.insert(0, Option.buildAll());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    List<Widget> cellList = [];
    int i = 0;
    list.forEach((e) {
      cellList.add(Selection(
        text: e.name,
        select: e.select,
        index: i++,
        callback: _checkCell,
      ));
    });

    return SelectionGrid(
      title: widget.input.name,
      children: cellList,
    );
  }

  // 如果添加地区，调用传入方法
  // 如果选择全部，取消其它，如果选中其他取消全部
  void _checkCell(int index) {
    Option option = list[index];
    if (option.isLocalAddAll()) {
      if (!option.select) {
        list.forEach((element) {
          element.select = false;
        });
        setState(() {
          option.select = true;
        });
      }
    } else {
      if (!option.select) {
        Option tmp = list.firstWhere((element) => element.isLocalAddAll());
        tmp.select = false;
      }
      setState(() {
        option.select = !option.select;
      });
    }
  }
}
