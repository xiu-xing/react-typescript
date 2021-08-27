import 'package:flutter/material.dart';
import 'package:rime_app/models/realm_config/input.dart';
import 'package:rime_app/models/realm_config/option.dart';

/// condition中可以打开搜索面板(可能有多个类型)的，保存搜索结果中选中的数据，通知展示组件中刷新数据
class InputProvider extends ChangeNotifier {
  Map<String, Input> _searchableInputMap;
  String? _nowChangedSearchableId;

  String get nowChangedSearchableId => _nowChangedSearchableId ?? "";

  InputProvider(this._searchableInputMap);

  void changeInputOption(String searchableId, List<Option> optionList) {
    _nowChangedSearchableId = searchableId;
    _searchableInputMap[searchableId]?.inputTypeConfig?.options = optionList;
    notifyListeners();
  }

  List<Option> getOptionList(String searchableId) {
    return _searchableInputMap[searchableId]?.inputTypeConfig?.options ?? [];
  }

  Input? getInput(String searchableId) {
    return _searchableInputMap[searchableId];
  }
}
