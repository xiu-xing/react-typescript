import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/realm_config/condition_map_item.dart';
import 'package:rime_app/models/realm_config/input.dart';
import 'package:rime_app/models/realm_config/operator.dart';
import 'package:rime_app/models/realm_config/option.dart';
import 'package:rime_app/widgets/realm/models/order_column.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

// 排序model转请求参数类
GOrderColumn? orderColumnModelToGOrderColumn(OrderColumnModel model) {
  Map<String, dynamic> map = Map();
  map['columnId'] = model.id;
  map['isDesc'] = true;
  return GOrderColumn.fromJson(map);
}

// 所有筛选项,提取:筛选参数list
List<GNextSearchConditionInput> configToConditionListParam(
    List<ConditionMapItem> mapItemList) {
  List<GNextSearchConditionInput> list = [];

  mapItemList.forEach((mapItem) {
    if (mapItem.input != null) {
      Input input = mapItem.input!;

      String sourceType = input.sourceType;
      bool isNum = sourceType == Const.sourceTypeNumber;

      String unit = "";
      Map<String, dynamic>? sourceTypeConfig = input.sourceTypeConfig;
      if (sourceTypeConfig != null &&
          input.sourceTypeConfig!.containsKey("unit")) {
        unit = sourceTypeConfig['unit']?['name'] ?? "";
      }

      List<Option>? optionList = input.inputTypeConfig?.options;
      if (optionList != null && optionList.isNotEmpty) {
        List<Map<String, dynamic>> optionInputListParam = [];

        optionList.forEach((element) {
          if (!element.isLocalAddAll()) {
            if (element.select) {
              Map<String, dynamic> optionJson = {
                "id": element.id,
                "name": element.name,
                "operator": element.operator,
                "values": element.values,
              };

              optionInputListParam.add(optionJson);
            } else if (element.isCustomized) {
              String start = element.start;
              String end = element.end;
              if (start.isNotEmpty && end.isNotEmpty) {
                Map<String, dynamic> optionJson = {
                  "id": element.id,
                  "name": unit.isEmpty
                      ? "$start - $end"
                      : "$start $unit - $end $unit",
                  "operator": element.operator,
                  "values": [
                    isNum ? start : timeStamp(start, element.datePickerType),
                    isNum ? end : timeStamp(end, element.datePickerType)
                  ],
                };

                optionInputListParam.add(optionJson);
              } else if (start.isNotEmpty) {
                Map<String, dynamic> optionJson = {
                  "id": element.id,
                  "name": unit.isEmpty ? "$start 之后" : "大于 $start $unit",
                  "operator": element.operator,
                  "values": [
                    isNum ? start : timeStamp(start, element.datePickerType),
                    ""
                  ],
                };

                optionInputListParam.add(optionJson);
              } else if (end.isNotEmpty) {
                Map<String, dynamic> optionJson = {
                  "id": element.id,
                  "name": unit.isEmpty ? "$end 之前" : "小于 $end $unit",
                  "operator": element.operator,
                  "values": [
                    "",
                    isNum ? end : timeStamp(end, element.datePickerType)
                  ],
                };

                optionInputListParam.add(optionJson);
              }
            }
          }
        });

        if (optionInputListParam.isNotEmpty) {
          Map<String, dynamic> json = {
            "id": mapItem.id,
            "options": optionInputListParam,
            "name": input.name, // mapItem.name
            "type": input.inputType,
          };

          // "operators": [
          // {
          // "name": "并集",
          // "operator": "INCLUDES_ANY"
          // },
          // {
          // "name": "交集",
          // "operator": "INCLUDES_ALL"
          // }
          // ]
          List<Operator> operator = input.operators;
          // 如果以后用到交并集的选择，可考虑把选中的放到数组中的第一个位置，方便取参
          if (operator.isNotEmpty) {
            Map<String, dynamic> operatorJson = {
              "operator": operator[0].operator
            };
            if (operator[0].name.isNotEmpty)
              operatorJson["name"] = operator[0].name;

            json["operator"] = operatorJson;
          }

          try {
            GNextSearchConditionInput conditionInput =
                GNextSearchConditionInput.fromJson(json)!;
            list.add(conditionInput);
          } catch (e) {
            print(
                "GNextSearchConditionInput fromJson error ------ ${e.toString()}");
          }
        }
      }
    }
  });

  return list;
}

// 单位秒，2021->时间戳或2021-06-11->时间戳
String timeStamp(String value, String datePickerType) {
  if (datePickerType == Const.datePickerTypeYear) {
    return (DateTime(int.parse(value)).millisecondsSinceEpoch / 1000)
        .floor()
        .toString();
  } else {
    return (DateTime.parse(value).millisecondsSinceEpoch / 1000)
        .floor()
        .toString();
  }
}
