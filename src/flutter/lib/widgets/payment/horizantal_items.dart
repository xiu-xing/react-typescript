import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/market/market.data.gql.dart';
import 'package:rime_app/graphql/queries/market/market.req.gql.dart';
import 'package:rime_app/graphql/queries/market/market.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';

class MarketHorizantalItems extends StatefulWidget {
  const MarketHorizantalItems({Key? key, this.onChange}) : super(key: key);

  final ValueChanged<String>? onChange;
  @override
  _MarketHorizantalItemsState createState() => _MarketHorizantalItemsState();
}

class _MarketHorizantalItemsState extends State<MarketHorizantalItems> {
  final Color avtivatedColor = theme.primaryColor;
  final Color nomalBorderColor = Pigment.fromString("#EEE");
  final Color nomalTitleColor = Pigment.fromString("#666");
  final Color avtivatedTitleColor = Pigment.fromString("#333");
  int currentItem = 0;
  List<GCommodityData_commodity> commodityList = [];

  void getCommodity() {
    GQL.executeQuery<GCommodityData, GCommodityVars>(
        GCommodityReq((b) => b
          ..requestId = "Commodity"
          ..vars.osType = Platform.isAndroid ? GOSType.Android : GOSType.IOS),
        onData: (stream, response) {
      stream.cancel();
      if (mounted)
        setState(() {
          commodityList = (response.data?.commodity.toList() ?? []);
        });
      if (widget.onChange != null &&
          commodityList.isNotEmpty &&
          commodityList[0].id != null) widget.onChange!(commodityList[0].id!);
    }, onError: (stream, error) {
      stream.cancel();
    });
  }

  Widget item(int index, GCommodityData_commodity commodity) {
    return GestureDetector(
      onTap: () {
        setState(() => currentItem = index);
        if (widget.onChange != null && commodity.id != null)
          widget.onChange!(commodity.id!);
      },
      child: Container(
        constraints: BoxConstraints(
          minHeight: 94.h,
          minWidth: 120.w,
          maxWidth: 120.w,
        ),
        margin: EdgeInsets.only(left: 16.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.w,
            color: currentItem == index ? avtivatedColor : nomalBorderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6.h)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              commodity.name ?? "",
              style: bodyText1.copyWith(
                fontWeight: FontWeight.w500,
                color: currentItem == index
                    ? avtivatedTitleColor
                    : nomalTitleColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  child: Text(
                    "￥",
                    style: subtitle1.copyWith(
                      color: avtivatedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  commodity.amount.toString(),
                  style: headline3.copyWith(color: avtivatedColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getCommodity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 8.h, right: 16.w, bottom: 12.h),
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              commodityList.length,
              (i) => item(i, commodityList[i]),
            ),
          ),
        ),
      ),
    );
  }
}
