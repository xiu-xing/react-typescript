import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/realm/realm.data.gql.dart';
import 'package:rime_app/graphql/queries/realm/realm.req.gql.dart';
import 'package:rime_app/graphql/queries/realm/realm.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/models/realm_config/condition_config.dart';
import 'package:rime_app/models/realm_config/condition_map_item.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/load_config.dart';
import 'package:rime_app/utils/permission.dart';
import 'package:rime_app/widgets/common/ac/ac.dart';
import 'package:rime_app/widgets/common/list_items/common.dart';
import 'package:rime_app/widgets/common/list_items/entity.dart';
import 'package:rime_app/widgets/common/list_widget/list_widget_next.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/common/pop_up_menu/customize_bottom_sheet.dart'
    as bs;
import 'package:rime_app/widgets/realm/condition_list/conditions.dart';
import 'package:rime_app/widgets/realm/models/order_column.dart';
import 'package:rime_app/widgets/realm/utils/data_to_param.dart';

/// 数据展示列表，每种类型显示各自condition弹窗，保存各自筛选数据
class RealmResults extends StatefulWidget {
  final String realmId;
  final void Function(String, int)? conditionOnChangeCallBack;

  RealmResults({
    Key? key,
    required this.realmId,
    this.conditionOnChangeCallBack,
  }) : super(key: key);

  @override
  RealmResultsState createState() => RealmResultsState();
}

class RealmResultsState extends State<RealmResults>
    with AutomaticKeepAliveClientMixin {
  StreamSubscription? appRealmSearchResultQueryStream;
  List<GAppRealmSearchResultData_appRealmSearchResult_nodes> dataList = [];
  bool fetching = true;
  bool hasError = false;
  // bool pullRefresh = false;
  String _endCursor = "";
  // Completer? completer;
  EasyRefreshController _controller = new EasyRefreshController();

  // 保存弹窗中用户选择
  List<OrderColumnModel> orderColumnList = [];
  List<ConditionMapItem> conditionMapItemList = [];

  // 接口参数，来自筛选项
  List<GNextSearchConditionInput> conditions = [];
  List<GOrderColumn> orderColumns = [];

  @override
  void initState() {
    super.initState();
  }

  GAppRealmSearchResultReq _query() {
    GAppRealmSearchResultReq req = GAppRealmSearchResultReq(
      (b) => b
        ..requestId = "REALM_search_result_${widget.realmId}"
        ..vars.realmID = widget.realmId
        ..vars.first = 20
        ..vars.orderColumns.replace(orderColumns)
        ..vars.conditions.replace(conditions),
    );
    MuseEventUtil.sendEvent(
      eventId: MuseEventUtil.RealmSearchEventId,
      value: {
        "conditions": {"value": conditions.toString()},
        "order_columns": {"value": orderColumns.toString()},
      },
    );
    return req;
  }

  void sendAppRealmSearchResultQuery() {
    if (appRealmSearchResultQueryStream != null) return;
    appRealmSearchResultQueryStream =
        GQL.executeQuery<GAppRealmSearchResultData, GAppRealmSearchResultVars>(
      _query(),
      onData: (s, r) {
        if (!mounted) return;
        setState(() => fetching = false);
        if (r.data?.appRealmSearchResult == null) return;
        bool res = true;

        if (r.data?.appRealmSearchResult?.permissions != null) {
          var list = r.data!.appRealmSearchResult!.permissions!.toList();
          list.forEach((value) {
            res = PermissionUtils.getPermission(value);
            if (res)
              context.showAC(type: ACDialogType.LoadLimit, message: "资源受限");
          });
        }

        dataList = r.data!.appRealmSearchResult?.nodes?.toList() ?? [];
        if (r.data?.appRealmSearchResult?.pageInfo.hasNextPage == false) {
          _endCursor = "";
        } else {
          _endCursor = r.data!.appRealmSearchResult!.pageInfo.endCursor ?? "";
        }

        _controller.finishRefresh(success: res);
        _controller.finishLoad(success: res);
        setState(() {});
      },
      onError: (s, e) {
        _controller.finishRefresh(success: false);
        _controller.finishLoad(success: false);
        if (mounted)
          setState(() {
            fetching = false;
            hasError = true;
          });
      },
    );
  }

  Future<void> pullRefreshCallback() async {
    _controller.resetLoadState();
    if (appRealmSearchResultQueryStream == null) {
      sendAppRealmSearchResultQuery();
    } else {
      GQL.ferryClient.requestController.add(_query());
    }
  }

  Future<void> loadMore() async {
    if (_endCursor == "" || fetching) return;

    GAppRealmSearchResultReq rebuildQuery = _query().rebuild(
      (b) => b
        ..vars.after = _endCursor
        ..updateResult = (previous, next) {
          if (next?.appRealmSearchResult?.pageInfo == null) return next;
          return previous?.rebuild((b) => b
                ..appRealmSearchResult
                    .nodes
                    .addAll(next!.appRealmSearchResult?.nodes ?? [])
                ..appRealmSearchResult
                    .permissions
                    .replace(next.appRealmSearchResult!.permissions!)
                ..appRealmSearchResult
                    .pageInfo
                    .replace(next.appRealmSearchResult!.pageInfo)) ??
              next;
        },
    );

    GQL.ferryClient.requestController.add(rebuildQuery);
  }

  void tuneButtonOnTap(GAppRealmData_appRealms realm) async {
    if (conditionMapItemList.isEmpty) {
      var configMap = await getConfig(REALM_CONDITION_CONFIG);
      if (configMap != null && configMap[widget.realmId] != null) {
        ConditionConfig conditionConfig =
            ConditionConfig.fromJson(configMap[widget.realmId]);

        Map<String, dynamic>? conditionMap = conditionConfig.conditionMap;
        conditionMap?.forEach((key, value) {
          conditionMapItemList.add(ConditionMapItem.fromJson(value));
        });
        // 只取预置项时
        // conditionConfig.presets?.forEach((e) {
        //   if (conditionMap?[e] != null) {
        //     conditionMapItemList
        //         .add(ConditionMapItem.fromJson(conditionMap![e]!));
        //   }
        // });
      }
    }

    bs.showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return RealmConditions(
            realm: realm,
            onConfirm: onConfirm,
            orderColumnList: orderColumnList,
            conditionMapItemList: conditionMapItemList,
            realmId: widget.realmId,
          );
        });
  }

  void onConfirm(
      List<OrderColumnModel> list, List<ConditionMapItem> mapItemList) {
    if (fetching) return;
    setState(() {
      fetching = true;
      hasError = false;
    });
    orderColumnList = list;
    conditionMapItemList = mapItemList;

    orderColumns.clear();
    list.forEach((element) {
      if (element.select && !element.isLocalDefaultOrder()) {
        GOrderColumn? gOrderColumn = orderColumnModelToGOrderColumn(element);
        if (gOrderColumn != null) orderColumns.add(gOrderColumn);
      }
    });
    if (mapItemList.isNotEmpty) {
      conditions = configToConditionListParam(mapItemList);
    } else {
      conditions.clear();
    }
    if (widget.conditionOnChangeCallBack != null) {
      widget.conditionOnChangeCallBack!(
          widget.realmId, orderColumns.length + conditions.length);
    }
    GQL.ferryClient.requestController.add(_query());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListWidgetNext(
      controller: _controller,
      onLoadCallback: loadMore,
      onRefreshCallback: pullRefreshCallback,
      itemCount: dataList.length,
      canLoad: _endCursor.isNotEmpty,
      itemBuilder: _item,
    );
  }

  Widget _item(BuildContext context, int index) {
    final result = dataList[index];

    EntityListItem entity = EntityListItem();
    String verticalAxisAlignment = "center";
    entity.buildAvatar(
      widget: NetWorkImage(
        margin: EdgeInsets.only(top: 5.w, right: 10.w),
        image: result.logoURI ?? "",
      ),
    );
    entity.buildTitle(title: result.primaryName);
    if (result.label != null && result.label != "") {
      verticalAxisAlignment = "start";
      entity.buildSubTitle(
          widget: Text(
        result.label ?? "",
        style: bodyText1.copyWith(color: Pigment.fromString("#666")),
      ));
    }

    if (result.description != null && result.description!.isNotEmpty) {
      verticalAxisAlignment = "start";
      entity.buildContent(content: result.description);
    }

    String entityId = result.entityID ?? "";
    String entityType = result.entityType?.toString() ?? "";
    Function tapFunction = () {
      router.navigateTo(
          context, '${Routes.profile}?id=$entityId&type=$entityType');
    };

    return Ink(
      child: InkWell(
        onTap: () {
          tapFunction();
        },
        child: CommonListItem(
          outPadding: EdgeInsets.only(
            left: 16.w,
            top: index == 0 ? 20.h : 14.h,
            right: 16.w,
            bottom: 14.h,
          ),
          commonEntity: entity,
          verticalAxisAlignment: verticalAxisAlignment,
        ),
      ),
    );
  }

  @protected
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    appRealmSearchResultQueryStream?.cancel();
    super.dispose();
  }
}
