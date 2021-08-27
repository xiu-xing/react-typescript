import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/key_value_map/key_value_map.data.gql.dart';
import 'package:rime_app/graphql/queries/key_value_map/key_value_map.req.gql.dart';
import 'package:rime_app/graphql/queries/key_value_map/key_value_map.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/deal/deal.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/utils/permission.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/ac/ac.dart';
import 'package:rime_app/widgets/common/circular_progress/circular_progress.dart';
import 'package:rime_app/widgets/common/list_items/common.dart';
import 'package:rime_app/widgets/common/list_items/entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/discovery/tab_panel/panel_wrapper.dart';

class LatestDealList extends StatefulWidget {
  @override
  _LatestDealListState createState() => _LatestDealListState();
}

class _LatestDealListState extends State<LatestDealList>
    with AutomaticKeepAliveClientMixin {
  List<DealModel> deals = [];

  bool fetching = true;
  Completer? _completer;
  bool timeout = false;
  bool hasNextPage = true;
  String? endCursor;
  StreamSubscription<dynamic>? _streamSubscription;
  EasyRefreshController _controller = new EasyRefreshController();

  GKeyValueMapReq req = GKeyValueMapReq((b) => b
    ..requestId = "discovery_latest_deal"
    ..vars.funcID = "pevc.latest_deal"
    ..vars.requestBody = "{\"type\":\"deal\",\"limit\":10}"
    ..vars.platform = GNextPlatform.PLATFORM_MOBILE);

  void _initQuery() {
    if (_streamSubscription != null) {
      GQL.ferryClient.requestController.add(req);
    } else {
      _streamSubscription =
          GQL.executeQuery<GKeyValueMapData, GKeyValueMapVars>(
        req,
        onData: (s, r) {
          if (_completer != null && !_completer!.isCompleted)
            _completer!.complete();
          // s.cancel();
          fetching = false;
          if (r.data?.keyValueMap == null) return;
          _controller.finishRefresh();

          bool res = false;
          if (r.data?.keyValueMap?.permissions?.isNotEmpty ?? false) {
            var list = r.data?.keyValueMap?.permissions!.toList();
            list!.forEach((value) {
              res = PermissionUtils.getPermission(value);
            });
          }
          if (res) {
            _controller.finishLoad(success: false);
            context.showAC(type: ACDialogType.LoadLimit, message: "资源受限");
          } else {
            _controller.finishLoad();
          }
          var data = jsonDecode(r.data!.keyValueMap!.data!);

          List<DealModel> d = [];
          final jsonList = data["deals"];
          if (jsonList is List && jsonList.isNotEmpty) {
            jsonList.forEach((element) {
              d.add(DealModel.fromJson(element));
            });
          }

          // var
          if (mounted)
            setState(() {
              hasNextPage = data["page_info"]["has_next_page"] ?? false;
              endCursor = data["page_info"]["end_cursor"]["value"];
              deals = d;
            });
          if (mounted && timeout) setState(() => timeout = false);
        },
        onError: (s, e) {
          _controller.finishRefresh();
          _controller.finishLoad(success: false);
          // s.cancel();
          if (_completer != null && !_completer!.isCompleted)
            _completer!.complete();
          setState(() {
            fetching = false;
            timeout = true;
          });
        },
      );
    }
  }

  Future<void> _loadMore() {
    _completer = new Completer();

    GKeyValueMapReq rebuildQuery = req.rebuild(
      (b) => b
        ..vars.requestBody =
            "{\"type\":\"deal\",\"limit\":10,\"after\":\"$endCursor\"}"
        ..updateResult = (prev, next) => prev?.rebuild(
              (b) {
                var prevDeals = prev.keyValueMap?.data == "" ||
                        prev.keyValueMap?.data == null
                    ? []
                    : jsonDecode(prev.keyValueMap!.data!)["deals"];

                var nextDeals = next?.keyValueMap?.data == "" ||
                        next?.keyValueMap?.data == null
                    ? []
                    : jsonDecode(next!.keyValueMap!.data!)?["deals"];

                var n = next?.keyValueMap?.data == "" ||
                        next?.keyValueMap?.data == null
                    ? jsonDecode(prev.keyValueMap!.data!)
                    : jsonDecode(next!.keyValueMap!.data!);

                String res = jsonEncode({
                  ...n,
                  "deals": [...prevDeals, ...nextDeals]
                });

                b.keyValueMap
                  ..permissions.replace(next!.keyValueMap!.permissions!)
                  ..data = res;

                return b;
              },
            ),
    );

    GQL.ferryClient.requestController.add(rebuildQuery);

    return _completer!.future;
  }

  Widget itemWidget(int index) {
    DealModel deal = deals[index];
    EntityListItem entity = EntityListItem();
    entity.buildAvatar(
      widget: NetWorkImage(
        margin: EdgeInsets.only(top: 5.w, right: 10.w),
        image: deal.primaryPortraitUri,
      ),
    );
    entity.buildTitle(title: deal.primaryName);
    entity.buildSubTitle(
      subTitle: deal.dealSize == "-"
          ? [deal.closedOn, deal.type].join("｜")
          : [deal.closedOn, deal.type, deal.dealSize].join("｜"),
    );
    return Ink(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          router.navigateTo(
            context,
            "${Routes.profile}?id=${deal.id}&type=EVENT",
          );
        },
        child: CommonListItem(
          outPadding: EdgeInsets.only(
            top: index == 0 ? 20.w : 14.w,
            right: 16.w,
            bottom: 14.w,
            left: 16.w,
          ),
          commonEntity: entity,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initQuery();
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (fetching) return CircularProgress(size: 24.sp);
    return timeout
        ? Empty404(reload: _initQuery)
        : PanelWrapper(
            controller: _controller,
            onRefresh: () async {
              _completer = new Completer();
              _initQuery();
              return _completer!.future;
            },
            onLoadMore: _loadMore,
            canLoad: hasNextPage && endCursor != null,
            itemCount: deals.length,
            itemBuilder: (context, index) => itemWidget(index),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
