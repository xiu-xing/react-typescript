import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/realm_suggestions/realm_suggestions.data.gql.dart';
import 'package:rime_app/graphql/queries/realm_suggestions/realm_suggestions.req.gql.dart';
import 'package:rime_app/graphql/queries/realm_suggestions/realm_suggestions.var.gql.dart';
import 'package:rime_app/models/realm_config/input.dart';
import 'package:rime_app/models/realm_config/option.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/list_widget/list_widget_next.dart';
import 'package:rime_app/widgets/realm/condition_list/sub_search/input.dart';
import 'package:rime_app/widgets/realm/condition_list/sub_search/result_item.dart';
import 'package:rime_app/widgets/realm/utils/const.dart';

import '../../../common/bottom_sheet/bottom_actions.dart';

class SubSearchPanel extends StatefulWidget {
  final String title;

  final ValueChanged<List<Option>> onConfirm;
  final ValueChanged<List<Option>> onReset;
  final VoidCallback onClose;
  final Input input;

  const SubSearchPanel({
    Key? key,
    required this.title,
    required this.onConfirm,
    required this.onClose,
    required this.onReset,
    required this.input,
  }) : super(key: key);

  @override
  _SubSearchPanelState createState() => _SubSearchPanelState();
}

class _SubSearchPanelState extends State<SubSearchPanel> {
  StreamSubscription<dynamic>? _streamSubscription;
  List<GRealmSuggestionsData_appRealmSuggestions_nodes> _dataList = [];
  String _endCursor = "";
  String _keyword = "";
  TextEditingController _textEditingController = TextEditingController();
  List<Option> lastOptionList = [];
  bool fetching = true;
  bool hasError = false;

  void onConfirm() {
    List<Option> tmp = [];

    Option? optionAddRegion;
    lastOptionList.forEach((element) {
      if (element.select || !element.userAdd) {
        if (element.isLocalAddRegion()) {
          optionAddRegion = element;
        } else {
          tmp.add(element);
        }
      }
    });
    // add to the end
    if (optionAddRegion != null) tmp.add(optionAddRegion!);
    setState(() => _keyword = "");
    _textEditingController.text = "";
    widget.onConfirm(tmp);
  }

  void onReset() {
    List<Option> tmp = [];
    lastOptionList.forEach((element) {
      if (!element.userAdd) {
        element.select = false;
        tmp.add(element);
      }
    });
    setState(() {
      lastOptionList = tmp;
      _keyword = "";
      _dataList = [];
      _textEditingController.text = "";
    });
    widget.onReset(tmp);
  }

  void searchData() {
    setState(() => fetching = true);
    if (_streamSubscription == null) {
      _streamSubscription =
          GQL.executeQuery<GRealmSuggestionsData, GRealmSuggestionsVars>(
        _queryReq(),
        onData: (stream, res) {
          setState(() => fetching = false);
          if (res.data == null) {
            setState(() => _dataList = []);
            return;
          }
          if (res.data!.appRealmSuggestions.pageInfo.hasNextPage)
            _endCursor = res.data!.appRealmSuggestions.pageInfo.endCursor ?? "";

          if (res.data!.appRealmSuggestions.nodes != null &&
              res.data!.appRealmSuggestions.nodes!.isNotEmpty) {
            setState(() {
              _dataList.addAll(res.data!.appRealmSuggestions.nodes!);
            });
          }
        },
        onError: (stream, error) {
          setState(() {
            fetching = false;
            _dataList = [];
          });
        },
      );
    } else {
      GQL.ferryClient.requestController.add(_queryReq());
    }
  }

  GRealmSuggestionsReq _queryReq() {
    final suggestionId = widget.input.inputTypeConfig?.suggestionId ?? "";
    return GRealmSuggestionsReq((b) => b
      ..requestId = "REALM_" + suggestionId
      ..vars.first = 50
      ..vars.suggestionId = suggestionId
      ..vars.query = _keyword.trim());
  }

  void _loadMore() {
    if (_endCursor.isEmpty) return;

    GRealmSuggestionsReq newReq =
        _queryReq().rebuild((b) => b..vars.after = _endCursor);
    GQL.ferryClient.requestController.add(newReq);
  }

  Option searchDataToOption(
      GRealmSuggestionsData_appRealmSuggestions_nodes node) {
    Map<String, dynamic> json = {
      "id": node.id,
      "name": node.primaryName,
      "operator": widget.input.operators.isEmpty
          ? ""
          : widget.input.operators[0].operator,
      "values": [node.id]
    };

    return Option.fromJson(json);
  }

  @override
  void initState() {
    super.initState();
    if (widget.input.inputTypeConfig != null)
      lastOptionList = List.from(widget.input.inputTypeConfig!.options);
  }

  Widget header() {
    return Container(
      height: 56.h,
      child: InkWell(
        onTap: widget.onClose,
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 12.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                MdiIcons.chevronLeft,
                size: 20.sp,
                color: Pigment.fromString("#333"),
              ),
              SizedBox(width: 5.w),
              Text(
                widget.title,
                style: subtitle1.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resultList() {
    if (_keyword.isEmpty) return Container();
    return ListWidgetNext(
      onLoadCallback: () async => _loadMore,
      itemCount: _dataList.length,
      canLoad: _endCursor.isNotEmpty,
      firstRefresh: false,
      itemBuilder: (context, index) {
        GRealmSuggestionsData_appRealmSuggestions_nodes node = _dataList[index];
        int i = lastOptionList.indexWhere((e) => e.id == node.id);
        return SubSearchResultItem(
          keyword: _keyword,
          node: _dataList[index],
          selected: i == -1 ? false : lastOptionList[i].select,
          onTap: () {
            if (i == -1) {
              lastOptionList.add(searchDataToOption(node)
                ..userAdd = true
                ..select = true);
            } else {
              lastOptionList[i].select = !lastOptionList[i].select;
            }
            setState(() {});
          },
        );
      },
    );
  }

  Widget? suffixIcon() {
    if (_keyword.isEmpty) return null;
    return Container(
      child: InkWell(
        child: Icon(
          MdiIcons.closeCircle,
          color: Pigment.fromString("#d6d6d6"),
          size: 22.w,
        ),
        onTap: () {
          _keyword = "";
          _textEditingController.clear();
          setState(() {
            _dataList.clear();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: Const.conditionHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            Expanded(
              child: Column(
                children: [
                  SubSearchInput(
                    controller: _textEditingController,
                    onChanged: (value) {
                      _keyword = value;
                      if (value.isNotEmpty) {
                        _dataList.clear();
                        searchData();
                      }
                    },
                    hintText: widget.input.inputTypeConfig?.placeholder,
                    suffixIcon: suffixIcon(),
                  ),
                  Expanded(child: _resultList()),
                ],
              ),
            ),
            BottomActions(
              height: Const.actionsHeight,
              onRest: onReset,
              onConfirm: _dataList.isNotEmpty ? onConfirm : null,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }
}
