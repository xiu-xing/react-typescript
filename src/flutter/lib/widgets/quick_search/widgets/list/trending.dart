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

class TrendingList extends StatefulWidget {
  const TrendingList({Key? key}) : super(key: key);

  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList>
    with AutomaticKeepAliveClientMixin {
  List<Node> dataList = [];
  bool _loadFinish = false;
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
    _loadFinish = false;
    querySubscription =
        GQL.executeQuery<GQuickSearchTrendingData, GQuickSearchTrendingVars>(
      _trendingReq,
      onData: (stream, response) {
        _loadFinish = true;
        if (response.data == null) {
          setState(() {
            dataList = [];
          });
          return;
        }

        _handleTrendingData(response.data!);
      },
      onError: (stream, error) {
        stream.cancel();
        _handleError(error);
      },
    );
  }

  void _handleError(List<GraphQLError> error) {
    setState(() {
      _loadFinish = true;
    });
  }

  GQuickSearchTrendingReq _trendingReq = GQuickSearchTrendingReq((b) => b
    ..requestId = "QKSH_trending"
    ..vars.first = 10);

  void _handleTrendingData(GQuickSearchTrendingData data) {
    if (data.quickSearchTrending.nodes != null &&
        data.quickSearchTrending.nodes!.isNotEmpty) {
      List<Node> list = [];
      data.quickSearchTrending.nodes!.forEach((e) {
        if (e
            is GQuickSearchTrendingData_quickSearchTrending_nodes__asQuickSearchEntityNode)
          list.add(Node.build(e));
      });
      dataList = list;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loadFinish) {
      return ContentList(
        dataList: dataList,
        refresh: () {
          GQL.ferryClient.requestController.add(_trendingReq);
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
