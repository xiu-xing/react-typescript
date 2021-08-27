import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/models/realm_config/option.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection.dart';
import 'package:rime_app/widgets/realm/condition_list/inputs/selection_grid.dart';
import 'package:rime_app/widgets/realm/condition_list/provider.dart';

/// 第一个为本地固定添加的“全部”，最后一个固定为本地添加的添加操作按钮，需特殊处理
/// 可添加元素，多选
class AddableSelectionCondition extends StatefulWidget {
  final String title;

  final ValueChanged<String>? onSearchField;

  final String searchableId;

  AddableSelectionCondition(
      {Key? key,
      required this.title,
      required this.onSearchField,
      required this.searchableId})
      : super(key: key);

  @override
  _AddableSelectionConditionState createState() =>
      _AddableSelectionConditionState();
}

class _AddableSelectionConditionState extends State<AddableSelectionCondition> {
  List<Option> list = [];

  @override
  Widget build(BuildContext context) {
    return Selector<InputProvider, InputProvider>(
      selector: (context, provider) => provider,
      shouldRebuild: (context, provider) =>
          widget.searchableId == provider.nowChangedSearchableId,
      builder: (context, provider, child) {
        return _content(provider);
      },
    );
  }

  Widget _content(InputProvider provider) {
    list = provider.getOptionList(widget.searchableId);
    if (list.isNotEmpty && !list.first.isLocalAddAll()) {
      list.insert(0, Option.buildAll());
    }

    List<Widget> cellList = [];
    int i = 0;
    list.forEach((e) {
      // 处理开始时选中全部，而去搜索结果中又有选中其他，去除全部的选中
      if (e.select && i != 0) list[0].select = false;
      cellList.add(Selection(
          text: e.name,
          select: e.select,
          index: i++,
          addRegion: e.localAddRegion,
          callback: _checkCell));
    });

    return SelectionGrid(
      title: widget.title,
      children: cellList,
      expend: true,
    );
  }

  // 如果添加地区，调用传入方法
  // 如果选择全部，取消其它，如果选中其他取消全部
  void _checkCell(int index) {
    Option option = list[index];
    if (option.isLocalAddRegion()) {
      if (widget.onSearchField != null)
        widget.onSearchField!(widget.searchableId);
    } else if (option.isLocalAddAll()) {
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
