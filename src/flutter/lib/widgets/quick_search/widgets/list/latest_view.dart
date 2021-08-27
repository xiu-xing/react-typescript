import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.data.gql.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.req.gql.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.var.gql.dart';
import 'package:rime_app/widgets/common/loading/loading.dart';
import 'package:rime_app/widgets/quick_search/models/node.dart';
import 'package:rime_app/widgets/quick_search/widgets/list/content_list.dart';

class LatestViewList extends StatefulWidget {
  const LatestViewList({Key? key}) : super(key: key);

  @override
  _LatestViewListState createState() => _LatestViewListState();
}

class _LatestViewListState extends State<LatestViewList>
    with AutomaticKeepAliveClientMixin {
  List<Node> dataList = [];
  bool _loadComplete = false;
  String endCursor = "";
  StreamSubscription? querySubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initData();
    });
  }

  @override
  void dispose() {
    querySubscription?.cancel();
    super.dispose();
  }

  void _initData() {
    _loadComplete = false;

    querySubscription = GQL
        .executeQuery<GQuickSearchLatestViewData, GQuickSearchLatestViewVars>(
      request,
      onData: (stream, response) {
        _loadComplete = true;
        if (response.data == null) {
          setState(() {
            dataList = [];
          });
          return;
        }
        _handLatestViewData(response.data!);
      },
      onError: (stream, error) {
        stream.cancel();
        _handleError(error);
      },
    );
  }

  void _handleError(List<GraphQLError> error) {
    setState(() {
      _loadComplete = true;
    });
  }

  GQuickSearchLatestViewReq request = GQuickSearchLatestViewReq((b) => b
    ..requestId = "QKSH_latest_view"
    ..vars.first = 10);

  void _handLatestViewData(GQuickSearchLatestViewData data) {
    if (data.quickSearchLatestView.nodes != null &&
        data.quickSearchLatestView.nodes!.isNotEmpty) {
      List<Node> list = [];
      data.quickSearchLatestView.nodes!.forEach((e) {
        if (e
            is GQuickSearchLatestViewData_quickSearchLatestView_nodes__asQuickSearchEntityNode)
          list.add(Node.build(e));
      });
      dataList = list;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loadComplete) {
      return ContentList(
        dataList: dataList,
        refresh: () {
          GQL.ferryClient.requestController.add(request);
          return Future.value();
        },
        hasNextPage: endCursor.isNotEmpty,
      );
    } else {
      return Center(child: Loading(scale: .4));
    }
  }

  @override
  bool get wantKeepAlive => true;
}
