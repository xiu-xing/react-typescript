import 'package:flutter/material.dart';
import 'package:rime_app/widgets/common/list_items/entity.dart';
import 'package:rime_app/widgets/common/list_items/item_wrapper.dart';

/// 通用list item，widget使用entity进行构造
/// 左右结构
/// 头像图片 - 标题文本
///          描述文本
///          正文
///          标签数组
///          分割线
class CommonListItem extends StatefulWidget {
  final EntityListItem? commonEntity;
  final List<Widget>? rightWidgets;
  final EdgeInsets? outPadding;
  final String? verticalAxisAlignment;

  const CommonListItem({
    Key? key,
    this.commonEntity,
    this.rightWidgets,
    this.outPadding,
    this.verticalAxisAlignment,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommonListItemState();
}

class _CommonListItemState extends State<CommonListItem> {
  @override
  Widget build(BuildContext context) {
    return ListItemWrapper(
      padding: widget.outPadding,
      child: Row(
        crossAxisAlignment: widget.verticalAxisAlignment == "center"
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          if (widget.commonEntity != null) widget.commonEntity!.avatarWidget,
          Expanded(
              child: Column(
            mainAxisAlignment: widget.verticalAxisAlignment == "center"
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _rightWidgets(),
          ))
        ],
      ),
    );
  }

  List<Widget> _rightWidgets() {
    if (widget.rightWidgets != null) return widget.rightWidgets!;

    if (widget.commonEntity != null)
      return [
        widget.commonEntity!.titleWidget,
        widget.commonEntity!.subTitleWidget,
        widget.commonEntity!.contentWidget,
        widget.commonEntity!.tagsWidget,
      ];

    return [];
  }
}
