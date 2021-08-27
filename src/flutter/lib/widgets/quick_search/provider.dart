import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.data.gql.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.req.gql.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.var.gql.dart';
import 'package:rime_app/utils/debounce.dart';
import 'package:rime_app/widgets/quick_search/models/tab_info.dart';

class QuickSearchProvider extends ChangeNotifier {
  List<TabInfo> quickSearchTabs = [];
  List<TabInfo> _quickSearchTabsOrigin = [];
  StreamSubscription? _incrementEntityClickThrough;

  List<String> _tabs = [];
  List<bool> _tabsLocked = [];
  String _keyword = '';
  bool dialogShow = false;

  List<String> get tabs => _tabs;

  List<bool> get tabsLocked => _tabsLocked;

  String get keyword => _keyword;

  bool get keywordEmpty => _keyword.isEmpty;

  List<StreamSubscription> _tabsGetCountStream = [];

  void init() {
    _searchTabs();
    _initIncrementEntityClickThroughReq();
  }

  GQuickSearchTabsReq _querySearchTabs() {
    return GQuickSearchTabsReq((b) => b..requestId = "QKSH_search_tabs");
  }

  void _initIncrementEntityClickThroughReq() {
    if (_incrementEntityClickThrough != null) return;
    _incrementEntityClickThrough = GQL.executeQuery<
        GIncrementEntityClickThroughData, GIncrementEntityClickThroughVars>(
      GIncrementEntityClickThroughReq((b) => b
        ..executeOnListen = false
        ..requestId = "qkshIncrementEntityClickThrough"
        ..vars.nodeId = ""
        ..vars.searchType = ""),
    );
  }

  void _searchTabs() {
    GQL.executeQuery<GQuickSearchTabsData, GQuickSearchTabsVars>(
      _querySearchTabs(),
      onData: (stream, response) {
        stream.cancel();
        if (response.data == null) {
          return;
        }

        quickSearchTabs = response.data!.quickSearchTabs
            .map((e) => TabInfo(e.title, e.searchType, e.lockPermission.locked))
            .toList();
        _quickSearchTabsOrigin = response.data!.quickSearchTabs
            .map((e) => TabInfo(e.title, e.searchType, e.lockPermission.locked))
            .toList();
      },
      onError: (stream, error) {
        stream.cancel();
      },
    );
  }

  void setInputValue(String input, [bool delay = true]) {
    debounce(() {
      _keyword = input;
      if (keywordEmpty) {
        notifyListeners();
      } else {
        _getSearchTabsCount();
      }
    }, delay ? 1000 : 1)();
  }

  void _resetQuickSearchTabs() {
    _tabs.clear();
    _tabsLocked.clear();

    quickSearchTabs.forEach((element) {
      _tabs.add(element.title);
      _tabsLocked.add(element.locked);
    });

    notifyListeners();
  }

  GQuickSearchReq _getQueryCount(String searchType) {
    return GQuickSearchReq((b) => b
      ..requestId = "QKSH_count_$searchType"
      ..vars.query = _keyword
      ..vars.first = 0
      ..vars.searchType = searchType);
  }

  void _getSearchTabsCount() {
    if (_tabsGetCountStream.isNotEmpty) {
      _reGetSearchTabsCount();
      return;
    }

    quickSearchTabs.forEach((element) {
      String type = element.searchType;
      _tabsGetCountStream
          .add(GQL.executeQuery<GQuickSearchData, GQuickSearchVars>(
        _getQueryCount(type),
        onData: (stream, response) {
          if (response.data != null) {
            int index = _quickSearchTabsOrigin
                .indexWhere((element) => element.searchType == type);

            int count = response.data!.quickSearch.totalCount;
            if (count > 0) {
              quickSearchTabs[index].title =
                  _quickSearchTabsOrigin[index].title +
                      " " +
                      (count > 99 ? "99+" : count.toString());
            } else {
              quickSearchTabs[index].title =
                  _quickSearchTabsOrigin[index].title;
            }
            _resetQuickSearchTabs();
          }
        },
        onError: (stream, error) {
          stream.cancel();
        },
      ));
    });
  }

  void _resetStreams() {
    _tabsGetCountStream.forEach((stream) {
      stream.cancel();
    });
    _tabsGetCountStream.clear();
  }

  void _reGetSearchTabsCount() {
    quickSearchTabs.forEach((element) {
      GQL.ferryClient.requestController.add(_getQueryCount(element.searchType));
    });
  }

  bool pageLocked(int index) {
    return quickSearchTabs[index].locked;
  }

  @override
  void dispose() {
    _resetStreams();
    _incrementEntityClickThrough?.cancel();
    super.dispose();
  }
}
