import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/models/rich_text_next/rich_text_next.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/common/rich_text_next.dart';
import 'package:rime_app/widgets/common/tags/quick_search_tag.dart';
import 'package:rime_app/widgets/common/tags/risk_tag.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/tags/text_tag.dart';

class TrackerTimelineItem extends StatelessWidget {
  const TrackerTimelineItem({
    Key? key,
    required this.node,
    this.isNeedFolded = false,
  }) : super(key: key);
  final GAppTrackerTimelineData_appTrackerTimeline_nodes node;
  final bool isNeedFolded;

  Widget headerWidget(BuildContext context) {
    return Row(
      children: [
        NetWorkImage(
          image: node.entity?.portraitURL ?? "",
          size: 20.w,
          margin: EdgeInsets.only(right: 6.w),
        ),
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Text(
            node.entity?.entityName ?? "",
            style: bodyText1.copyWith(
              color: Pigment.fromString("#333"),
              height: 1.2,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        if (node.time != 0)
          Text(
            DateTime.fromMillisecondsSinceEpoch(node.time * 1000)
                .toString()
                .substring(0, 10),
            style: subtitle2,
          ),
      ],
    );
  }

  Widget richTextWidget(String data) {
    try {
      List<RichTextNextModel> listData = (jsonDecode(data) as List<dynamic>)
          .map((e) => RichTextNextModel.fromJson(e))
          .toList();

      return RichTextNext(
        models: listData,
        textStyle: bodyText1.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Pigment.fromString("#666"),
        ),
        entityName: node.entity?.entityName ?? "",
        maxLines: isNeedFolded ? 4 : null,
      );
    } catch (e) {
      return Container();
    }
  }

  Widget tagsWidget() {
    if (node.tags == null || node.tags!.isEmpty) return Container();
    return Wrap(
      spacing: 10.w,
      runSpacing: 8.h,
      children: node.tags!.map((e) => tagWidget(e)).toList(),
    );
  }

  Widget tagWidget(GAppTrackerTimelineData_appTrackerTimeline_nodes_tags tag) {
    if (tag
        is GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asTextTag) {
      return TextTag(textTag: tag);
    }
    if (tag
        is GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asRiskTag) {
      return RiskTag(riskTag: tag);
    }
    if (tag
        is GAppTrackerTimelineData_appTrackerTimeline_nodes_tags__asQuickSearchTag) {
      return QuickSearchTag(quickSearchTag: tag);
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerWidget(context),
          SizedBox(height: 8.h),
          richTextWidget(node.data),
          // if (node.tags != null && node.tags!.isNotEmpty)
          //   SizedBox(height: 10.h),
          // tagsWidget(),
        ],
      ),
    );
  }
}
