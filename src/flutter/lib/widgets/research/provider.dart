import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/research/research.data.gql.dart';
import 'package:rime_app/graphql/queries/research/research.req.gql.dart';
import 'package:rime_app/graphql/queries/research/research.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';

class ResearchProvider extends ChangeNotifier {
  late BuildContext _context;
  final storage = new FlutterSecureStorage();

  ResearchProvider(BuildContext context) {
    this._context = context;
  }

  final List<String> moduleIds = [
    "research.research_report",
    "research.research_diagram"
  ];

  final List<String> moduleLables = ["报告", "图表"];

  Map<String, GFilterInputs> _filterInputsMap = {
    "research.research_report": GFilterInputs(),
    "research.research_diagram": GFilterInputs()
  };

  Map<String, GFilterInputs> _bufferedFilterInputsMap = {
    "research.research_report": GFilterInputs(),
    "research.research_diagram": GFilterInputs()
  };

  Map<String, GSuggestionFilterInput?> _suggestionFilterInputMap = {};

  Map<String, List<GArticleTabsData_appArticleTabs__asArticleTab_filters>?>
      _filtersMap = {};

  Map<String,
          GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter?>
      _suggestionFilterMap = {};

  int _activitedIndex = 0;

  String _token = "";
  String _query = "";

  void updateIndex(int value) {
    _activitedIndex = value;
    String moduleId = moduleIds[value];
    if (_suggestionFilterMap.containsKey(moduleId)) {
      var suggestionFilter = this._suggestionFilterMap[moduleId]!;

      if (this._query == "") {
        _suggestionFilterInputMap[moduleId] =
            GSuggestionFilterInput((b) => b..filterID = suggestionFilter.id);
      } else {
        _suggestionFilterInputMap[moduleId] =
            _buildSuggestionFilterInput(this._query);
      }
    }

    notifyListeners();
  }

  void updateQuery(String value) {
    _query = value;
    String moduleId = moduleIds[this.activitedIndex];
    var suggestionFilter = this._suggestionFilterMap[moduleId]!;
    if (value == "") {
      _suggestionFilterInputMap[moduleId] =
          GSuggestionFilterInput((b) => b..filterID = suggestionFilter.id);
    } else {
      _suggestionFilterInputMap[moduleId] = _buildSuggestionFilterInput(value);
    }

    notifyListeners();
  }

  GSuggestionFilterInput _buildSuggestionFilterInput(String value) {
    String moduleId = moduleIds[this.activitedIndex];
    var suggestionFilter = this._suggestionFilterMap[moduleId]!;

    return GSuggestionFilterInput(
      (b) => b
        ..filterID = suggestionFilter.id
        ..name = suggestionFilter.name
        ..values.replace([value])
        ..displayValue = value,
    );
  }

  Future<void> init() async {
    String? token = await storage.read(key: "token");

    if (token != null) _token = token;
    moduleIds.forEach((m) {
      _fetchFilters(m, this._context);
    });
    notifyListeners();
  }

  _fetchFilters(String moduleId, BuildContext context) {
    GQL.executeQuery<GArticleTabsData, GArticleTabsVars>(
      GArticleTabsReq((r) => r..vars.articleModuleID = moduleId),
      context: context,
      onData: (s, d) {
        s.cancel();
        var tab = d.data?.appArticleTabs.toList().first;

        if (tab != null && tab.G__typename == "ArticleTab") {
          List<GArticleTabsData_appArticleTabs__asArticleTab_filters>? list =
              (tab as GArticleTabsData_appArticleTabs__asArticleTab)
                  .filters
                  ?.toList();

          if (list != null) {
            _suggestionFilterMap[moduleId] = list[list.indexWhere(
                    (element) => element.G__typename == "SuggestionFilter")]
                as GArticleTabsData_appArticleTabs__asArticleTab_filters__asSuggestionFilter;

            list.removeWhere(
                (element) => element.G__typename == "SuggestionFilter");

            _filtersMap[moduleId] = list;
            _filterInputsMap[moduleId] = getDefaultFilterInputs(list);
            _bufferedFilterInputsMap[moduleId] = getDefaultFilterInputs(list);
          }
          notifyListeners();
        }
      },
      onError: (s, r) {
        s.cancel();
      },
    );
  }

  void updateSelectorFilterValue(GSelectorFilterInput value) {
    String moduleId = moduleIds[this.activitedIndex];
    if (_bufferedFilterInputsMap[moduleId] == null) return;
    _bufferedFilterInputsMap[moduleId] =
        _bufferedFilterInputsMap[moduleId]!.rebuild((f) {
      f..selectorFilterInputs.removeWhere((c) => c.filterID == value.filterID);
      return f..selectorFilterInputs.add(value);
    });

    notifyListeners();
  }

  void updateMutilSelectorFilterValue(GMultiSelectorFilterInput value) {
    String moduleId = moduleIds[this.activitedIndex];
    if (_bufferedFilterInputsMap[moduleId] == null) return;
    _bufferedFilterInputsMap[moduleId] =
        _bufferedFilterInputsMap[moduleId]!.rebuild((f) {
      f
        ..multiSelectorFilterInputs
            .removeWhere((c) => c.filterID == value.filterID);
      return f..multiSelectorFilterInputs.add(value);
    });

    notifyListeners();
  }

  static GFilterInputs getDefaultFilterInputs(
      List<GArticleTabsData_appArticleTabs__asArticleTab_filters> filters) {
    GFilterInputs res = new GFilterInputs();

    filters.forEach((f) {
      switch (f.G__typename) {
        case "SelectorFilter":
          {
            var filter = f
                as GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter;

            if (filter.multiple == true) {
              var input = GMultiSelectorFilterInput((b) => b
                ..filterID = filter.id
                ..name = filter.name
                ..operator = filter.operator
                ..filterValues.replace([]));
              res = res.rebuild((b) => b.multiSelectorFilterInputs.add(input));
              break;
            } else {
              var input = GSelectorFilterInput(
                (b) => b
                  ..filterID = filter.id
                  ..filterValue = filter.defaultValue ?? ""
                  ..name = filter.name
                  ..operator = filter.operator,
              );

              res = res.rebuild((b) => b.selectorFilterInputs.add(input));

              break;
            }
          }
        default:
      }
    });

    return res;
  }

  GArticleType getArticleTypeByModuleId(String id) {
    switch (id) {
      case "research.research_report":
        return GArticleType.ARTICLE_TYPE_RESEARCH_REPORT;
      case "research.research_diagram":
        return GArticleType.ARTICLE_TYPE_RESEARCH_CHART;
      default:
        return GArticleType.ARTICLE_TYPE_RESEARCH_REPORT;
    }
  }

  String getArticleListIdByModuleId(String id) {
    switch (id) {
      case "research.research_report":
        return "research.research_report_list";
      case "research.research_diagram":
        return "research.research_report_chart_list";
      default:
        return "";
    }
  }

  void resetBufferedFilterInputs() {
    _bufferedFilterInputsMap[moduleIds[_activitedIndex]] =
        getDefaultFilterInputs(_filtersMap[moduleIds[_activitedIndex]]!);
    notifyListeners();
  }

  void applyBufferdFilterInputs() {
    if (_bufferedFilterInputsMap[moduleIds[_activitedIndex]] != null) {
      _filterInputsMap[moduleIds[_activitedIndex]] =
          _bufferedFilterInputsMap[moduleIds[_activitedIndex]]!;
      notifyListeners();
    }
  }

  int get activitedIndex => _activitedIndex;
  String get activedModuleId => moduleIds[_activitedIndex];
  List<GArticleTabsData_appArticleTabs__asArticleTab_filters>? get filters =>
      _filtersMap[moduleIds[_activitedIndex]];

  GFilterInputs? get filterInputs {
    String moduleId = moduleIds[_activitedIndex];

    if (_filterInputsMap[moduleId] != null) {
      if (_suggestionFilterInputMap[moduleId] != null) {
        return _filterInputsMap[moduleId]!.rebuild((b) {
          b
            ..suggestionFilterInput.removeWhere((s) =>
                s.filterID == _suggestionFilterInputMap[moduleId]!.filterID);
          return b
            ..suggestionFilterInput.add(_suggestionFilterInputMap[moduleId]!);
        });
      }
      return _filterInputsMap[moduleId]!;
    }

    return GFilterInputs();
  }

  GFilterInputs? get bufferedFilterInputs =>
      _bufferedFilterInputsMap[moduleIds[_activitedIndex]];

  String get token => _token;

  @override
  void dispose() {
    super.dispose();
  }
}
