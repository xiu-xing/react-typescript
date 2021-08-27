import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.data.gql.dart';
import 'package:rime_app/graphql/queries/quick_search/quick_search.req.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/action.dart';
import 'package:rime_app/utils/highlight_span.dart';
import 'package:rime_app/widgets/common/list_items/common.dart';
import 'package:rime_app/widgets/common/list_items/entity.dart';
import 'package:rime_app/widgets/common/list_items/info.dart';
import 'package:rime_app/widgets/common/list_widget/list_widget_next.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/quick_search/models/node.dart';

class ContentList extends StatelessWidget {
  final List<Node> dataList;
  final bool locked;
  final Future<void> Function()? loadMoreFunction;
  final Future<void> Function()? refresh;
  final bool hasNextPage;

  const ContentList({
    Key? key,
    required this.dataList,
    this.locked = false,
    this.loadMoreFunction,
    this.refresh,
    this.hasNextPage = false,
  }) : super(key: key);

  void itemOnTap(BuildContext context, Node node, bool incrementENtity) {
    GIncrementEntityClickThroughReq query =
        GIncrementEntityClickThroughReq((b) => b
          ..requestId = "qkshIncrementEntityClickThrough"
          ..vars.nodeId = node.nodeId
          ..vars.searchType = node.searchType);
    if (incrementENtity) GQL.ferryClient.requestController.add(query);
    if (node.action != null) {
      FluroUtil.navigatorByAction(context, tapAction: node.action!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListWidgetNext(
      onRefreshCallback: refresh,
      onLoadCallback: loadMoreFunction,
      itemCount: dataList.length,
      canLoad: hasNextPage,
      itemBuilder: (BuildContext context, int index) {
        return _item(context, index);
      },
      firstRefresh: false,
      locked: locked,
    );
  }

  Widget _item(BuildContext context, int index) {
    final result = dataList[index];
    Widget content = Container();
    switch (result.type) {
      case QuickSearchNodeType.ENTITY:
        content = Ink(
          child: InkWell(
            onTap: () {
              itemOnTap(context, result, true);
            },
            child: CommonListItem(
                outPadding: EdgeInsets.only(
                  left: 16.w,
                  top: index == 0 ? 20.h : 14.h,
                  right: 16.w,
                  bottom: 14.h,
                ),
                commonEntity: _buildEntityListItem(result)),
          ),
        );
        break;
      case QuickSearchNodeType.INFOFLOW:
        String? source;
        var res = result.infoFlowTags?.first;

        if (res
            is GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags__asQuickSearchTag) {
          source = res.matchedName;
        }

        content = InfoFlowItem(
          onTap: () {
            itemOnTap(context, result, false);
          },
          title: result.title,
          source: source,
          content: result.description,
          publishTime: result.publishTime,
          shareable: false,
          // relatedEntity: news[index].relatedEntity.toList(),
        );
        break;
      default:
        break;
    }
    return content;
  }

  EntityListItem _buildEntityListItem(Node result) {
    final entity = EntityListItem();
    entity.buildAvatar(
      widget: NetWorkImage(
        margin: EdgeInsets.only(top: 5.w, right: 10.w),
        image: result.logoURI ?? "",
      ),
    );

    List<String>? keywordList = result.highlightTexts;

    if (keywordList == null || keywordList.isEmpty) {
      entity.buildTitle(title: result.title);

      entity.buildSubTitle(subTitle: result.subtitle);

      if (result.description != null && result.description!.isNotEmpty)
        entity.buildContent(content: result.description);
    } else {
      if (result.title != null && result.title!.isNotEmpty)
        entity.buildTitle(
          widget: RichText(
            text: TextSpan(
              children: splitTextSpan(
                result.title!,
                keywordList,
                normalStyle: headline2.copyWith(fontWeight: FontWeight.w500),
                highlightStyle: headline2.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.primaryColor,
                ),
              ),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );

      if (result.subtitle != null && result.subtitle!.isNotEmpty)
        entity.buildSubTitle(
          widget: Padding(
            padding: EdgeInsets.only(top: 1.w),
            child: RichText(
              text: TextSpan(
                children: splitTextSpan(
                  result.subtitle!,
                  keywordList,
                  normalStyle: bodyText1.copyWith(
                    color: Pigment.fromString('#666'),
                    height: 1.71,
                  ),
                  highlightStyle: bodyText1.copyWith(
                      color: theme.primaryColor, height: 1.71),
                ),
              ),
            ),
          ),
        );

      if (result.description != null && result.description!.isNotEmpty)
        entity.buildContent(
          widget: Padding(
            padding: EdgeInsets.only(top: 1.w),
            child: RichText(
              text: TextSpan(
                children: splitTextSpan(
                  result.description!,
                  keywordList,
                  normalStyle: bodyText1.copyWith(
                    color: Pigment.fromString("#999"),
                    height: 1.71,
                  ),
                  highlightStyle: bodyText1.copyWith(
                    color: theme.primaryColor,
                    height: 1.71,
                  ),
                ),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
    }
    return entity;
  }
}
