import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/market/market.data.gql.dart';
import 'package:rime_app/graphql/queries/market/market.req.gql.dart';
import 'package:rime_app/graphql/queries/market/market.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/list_widget/list_widget_next.dart';

class MarketManagement extends StatefulWidget {
  const MarketManagement({Key? key}) : super(key: key);

  @override
  _MarketManagementState createState() => _MarketManagementState();
}

class _MarketManagementState extends State<MarketManagement> {
  List<GUserOrdersData_userOrders_myOrder> ordersList = [];
  int totalCount = 0;
  GUserOrdersReq request = GUserOrdersReq((b) => b
    ..requestId = "userOrders"
    ..vars.limit = 25
    ..vars.offset = 0);
  StreamSubscription? getOrdersQuery;
  EasyRefreshController _controller = new EasyRefreshController();

  void getOrders() {
    getOrdersQuery = GQL.executeQuery<GUserOrdersData, GUserOrdersVars>(
      request,
      onData: (stream, response) {
        _controller.finishRefresh(success: true);
        _controller.finishLoad(success: true);
        if (response.data?.userOrders == null) return;
        if (mounted)
          setState(() {
            ordersList = response.data?.userOrders?.myOrder.toList() ?? [];
            totalCount = response.data?.userOrders?.count ?? 0;
          });
      },
      onError: (stream, error) {
        _controller.finishRefresh(success: false);
        _controller.finishLoad(success: false);
      },
    );
  }

  Future<void> onLoad() async {
    var newRequest = request.rebuild(
      (b) => b
        ..vars.offset = ordersList.length
        ..updateResult = (previous, next) =>
            previous?.rebuild(
              (b) =>
                  b..userOrders.myOrder.addAll(next!.userOrders?.myOrder ?? []),
            ) ??
            next,
    );

    GQL.ferryClient.requestController.add(newRequest);
  }

  Future<void> onRefresh() async {
    if (getOrdersQuery != null)
      GQL.ferryClient.requestController.add(request);
    else {
      getOrders();
    }
  }

  Widget textWidget({String? text}) {
    if (text == null) {
      return Text(
        "支付失败",
        style: headline2.copyWith(
          color: Pigment.fromString("#E00000"),
          fontWeight: FontWeight.w500,
        ),
      );
    }
    return Text(
      text,
      style: headline1.copyWith(color: theme.primaryColor),
    );
  }

  Widget listItem(GUserOrdersData_userOrders_myOrder order) {
    String startTime =
        DateTime.fromMillisecondsSinceEpoch((order.createTime!) * 1000)
            .toString()
            .substring(0, 10);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.commodityName ?? "",
                style: subtitle1.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2.w),
              Text(
                "$startTime",
                style: bodyText1.copyWith(
                  color: Pigment.fromString("#666"),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textWidget(
              text: order.orderStats == GOrderStats.SUCCESS
                  ? order.amount.toString()
                  : null),
        ],
      ),
    );
  }

  @override
  void dispose() {
    getOrdersQuery?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 44,
        leading: IconButton(
          splashRadius: 20.w,
          icon: Icon(
            Icons.chevron_left,
            size: 24.w,
            color: Pigment.fromString('#333333'),
          ),
          onPressed: () => Navigator.pop(context),
          // margin: EdgeInsets.only(left: 8.w),
        ),
        title: Text("订单管理", style: headline1),
        elevation: 0,
        centerTitle: true,
        actions: [
          // GestureDetector(
          //   onTap: () {},
          //   child: Center(
          //     child: Text(
          //       "开发票",
          //       style: caption.copyWith(fontWeight: FontWeight.w500),
          //     ),
          //   ),
          // ),
          // SizedBox(width: 16),
        ],
      ),
      body: ListWidgetNext(
        controller: _controller,
        canLoad: ordersList.length < totalCount,
        onLoadCallback: onLoad,
        onRefreshCallback: onRefresh,
        itemCount: ordersList.length,
        itemBuilder: (context, index) {
          return listItem(ordersList[index]);
        },
      ),
    );
  }
}
