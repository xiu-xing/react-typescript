import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/graphql/queries/realm/realm.data.gql.dart';
import 'package:rime_app/models/realm_config/condition_config.dart';
import 'package:rime_app/models/realm_config/condition_map_item.dart';
import 'package:rime_app/models/realm_config/input.dart';
import 'package:rime_app/models/realm_config/input_type_enum.dart';
import 'package:rime_app/models/realm_config/option.dart';
import 'package:rime_app/utils/load_config.dart';
import 'package:rime_app/widgets/common/bottom_sheet/bottom_sheet_wrapper.dart';
import 'package:rime_app/widgets/realm/condition_list/conditions/addable_selection_condition.dart';
import 'package:rime_app/widgets/realm/condition_list/conditions/date_condition.dart';
import 'package:rime_app/widgets/realm/condition_list/conditions/number_condition.dart';
import 'package:rime_app/widgets/realm/condition_list/conditions/order_condition.dart';
import 'package:rime_app/widgets/realm/condition_list/conditions/selection_conditon.dart';
import 'package:rime_app/widgets/realm/condition_list/provider.dart';
import 'package:rime_app/widgets/realm/condition_list/sub_search/sub_search.dart';
import 'package:rime_app/widgets/realm/models/order_column.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 筛选项弹框，排序+过滤项
class RealmConditions extends StatefulWidget {
  @override
  _RealmConditionsState createState() => _RealmConditionsState();

  RealmConditions({
    Key? key,
    required this.realm,
    required this.onConfirm,
    required this.conditionMapItemList,
    required this.orderColumnList,
    required this.realmId,
  }) : super(key: key);

  final String realmId;
  final GAppRealmData_appRealms realm;
  final Function(List<OrderColumnModel>, List<ConditionMapItem>) onConfirm;
  final List<ConditionMapItem> conditionMapItemList;
  final List<OrderColumnModel> orderColumnList;
}

class _RealmConditionsState extends State<RealmConditions> {
  late List<ConditionMapItem> conditionMapItemList;

  late List<OrderColumnModel> orderColumnList;

  Map<String, Input> searchableInputMap = Map();
  String nowSearchableId = "";
  bool showSearchCover = false;
  UniqueKey resetKey = UniqueKey();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // deep copy <- wtf ??????
    orderColumnList = [];
    widget.orderColumnList.forEach((element) {
      OrderColumnModel newElement = new OrderColumnModel(
        element.id,
        element.name,
        element.select,
      );
      orderColumnList.add(newElement);
    });
    conditionMapItemList = [];
    // deep copy
    widget.conditionMapItemList.forEach((element) {
      conditionMapItemList
          .add(ConditionMapItem.fromJson(jsonDecode(jsonEncode(element))));
    });
    if (orderColumnList.isEmpty) {
      initOrderColumn();
    }
    super.initState();
  }

  void onConfirmHandle() {
    widget.onConfirm(orderColumnList, conditionMapItemList);
    Navigator.of(context).pop();
  }

  void onResetHandle() async {
    conditionMapItemList.clear();
    var configMap = await getConfig(REALM_CONDITION_CONFIG);
    if (configMap != null) {
      ConditionConfig conditionConfig =
          ConditionConfig.fromJson(configMap[widget.realmId]);

      Map<String, dynamic>? conditionMap = conditionConfig.conditionMap;
      conditionMap?.forEach((key, value) {
        conditionMapItemList.add(ConditionMapItem.fromJson(value));
      });
    }

    resetKey = UniqueKey();
    setState(() {
      orderColumnList.clear();
      initOrderColumn();
    });
  }

  void initOrderColumn() {
    List<GAppRealmData_appRealms_orderColumns>? orderColumns =
        widget.realm.orderColumns?.toList();
    if (orderColumns != null && orderColumns.isNotEmpty) {
      orderColumnList.add(OrderColumnModel.buildDefault());
      orderColumnList.addAll(orderColumns
          .map((e) => OrderColumnModel(e.id, e.name, false))
          .toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    searchableInputMap.clear();

    List<Widget> list = [];
    if (orderColumnList.isNotEmpty) {
      list.add(OrderCondition(
        title: "排序方式",
        orderColumns: orderColumnList,
      ));
      list.add(SizedBox(
        height: 30.h,
      ));
    }

    conditionMapItemList.forEach((mapItem) {
      if (mapItem.input != null) {
        Widget? widget;
        Input input = mapItem.input!;
        switch (input.inputType) {
          case InputTypeEnum.DATE_RANGE:
            widget = DateCondition(
              input: input,
            );
            break;
          case InputTypeEnum.CHECKBOX:
            widget = SelectionCondition(
              input: input,
            );
            break;
          case InputTypeEnum.SEARCH_FIELD:
            bool searchable = input.inputTypeConfig?.searchable ?? false;
            if (input.inputTypeConfig != null && searchable) {
              // 如果没有添加“添加xx”，此处判断并添加
              if (input.inputTypeConfig?.options == null ||
                  input.inputTypeConfig!.options.isEmpty) {
                input.inputTypeConfig?.options = [
                  Option.buildAddRegion(input.inputTypeConfig?.extraText)
                ];
              } else {
                List<Option> options = input.inputTypeConfig!.options;
                if (!options[options.length - 1].isLocalAddRegion())
                  options.add(
                    Option.buildAddRegion(input.inputTypeConfig?.extraText),
                  );
              }

              searchableInputMap.putIfAbsent(input.name, () => input);
            }

            widget = AddableSelectionCondition(
              title: input.name,
              searchableId: input.name,
              onSearchField: (searchableId) {
                setState(() {
                  nowSearchableId = searchableId;
                  showSearchCover = true;
                });
              },
            );
            break;
          case InputTypeEnum.RANGE:
            widget = NumberCondition(
              input: input,
              title: input.name,
            );
            break;
          case InputTypeEnum.FIELD:
            // 纯输入，比如：管理团队、董事会、创始人、自定义赛道
            bool searchable = input.inputTypeConfig?.searchable ?? false;
            if (input.inputTypeConfig != null && searchable) {
              // 如果没有添加“添加xx”手动添加
              if (input.inputTypeConfig?.options == null ||
                  input.inputTypeConfig!.options.isEmpty) {
                input.inputTypeConfig?.options = [
                  Option.buildAddRegion(input.inputTypeConfig?.extraText)
                ];
              } else {
                List<Option> options = input.inputTypeConfig!.options;
                if (!options[options.length - 1].isLocalAddRegion())
                  options.add(
                      Option.buildAddRegion(input.inputTypeConfig?.extraText));
              }

              searchableInputMap.putIfAbsent(input.name, () => input);
            }

            widget = AddableSelectionCondition(
              title: input.name,
              searchableId: input.name,
              onSearchField: (searchableId) {
                setState(() {
                  nowSearchableId = searchableId;
                  showSearchCover = true;
                });
              },
            );
            break;
        }

        if (widget != null)
          list.add(Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: widget,
          ));
      }
    });

    double bottom = MediaQuery.of(context).viewInsets.bottom;
    // 软键盘高减底部button高
    bottom = bottom - Const.actionsHeight;
    bottom = bottom > 0 ? bottom : 0;

    Widget content = BottomSheetWrapper(
        totalHeight: Const.conditionHeight,
        bottomHeight: Const.actionsHeight,
        body: Scrollbar(
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                key: resetKey,
                children: list,
              ),
            ),
          ),
        ),
        title: "筛选",
        onConfirm: onConfirmHandle,
        onReset: onResetHandle);

    content = GestureDetector(
      child: content,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );

    if (searchableInputMap.isNotEmpty) {
      final width = MediaQuery.of(context).size.width;
      return ChangeNotifierProvider<InputProvider>(
        create: (BuildContext context) => InputProvider(searchableInputMap),
        child: Stack(
          children: [
            content,
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.fastOutSlowIn,
              top: 0,
              left: showSearchCover ? 0 : width,
              child: nowSearchableId.isEmpty
                  ? Container()
                  : Selector<InputProvider, InputProvider>(
                      selector: (_, provider) => provider,
                      shouldRebuild: (_, provider) => false,
                      builder: (c, provider, _) {
                        Input input = provider.getInput(nowSearchableId)!;
                        return SubSearchPanel(
                          key: ValueKey("input_key_${input.name}"),
                          title: input.name,
                          input: input,
                          onConfirm: (optionList) {
                            provider.changeInputOption(
                                nowSearchableId, optionList);

                            setState(() => showSearchCover = false);
                          },
                          onReset: (optionList) {
                            provider.changeInputOption(
                                nowSearchableId, optionList);
                          },
                          onClose: () {
                            setState(() => showSearchCover = false);
                          },
                        );
                      },
                    ),
            )
          ],
        ),
      );
    }

    return content;
  }
}
