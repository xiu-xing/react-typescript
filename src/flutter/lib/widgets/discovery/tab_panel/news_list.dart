import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/news/news_list.data.gql.dart';
import 'package:rime_app/graphql/queries/news/news_list.req.gql.dart';
import 'package:rime_app/graphql/queries/news/news_list.var.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/circular_progress/circular_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/list_items/info.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/discovery/tab_panel/panel_wrapper.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>
    with AutomaticKeepAliveClientMixin {
  GNewsListReq request = GNewsListReq((b) => b
    ..requestId = "discovery_news_list"
    ..vars.first = 50);

  bool fetching = true;
  List<GNewsListData_newsList_nodes> news = [];
  Completer? _completer;
  bool timeout = false;

  void query() {
    GQL.executeQuery<GNewsListData, GNewsListVars>(
      request,
      onData: (s, r) {
        s.cancel();
        if (_completer != null && !_completer!.isCompleted)
          _completer!.complete();
        if (mounted) setState(() => fetching = false);
        if (r.data?.newsList?.nodes == null || !mounted) return;
        setState(() => news = r.data!.newsList!.nodes!.toList());
        if (mounted && timeout) setState(() => timeout = false);
      },
      onError: (s, e) {
        s.cancel();
        if (_completer != null && !_completer!.isCompleted)
          _completer!.complete();
        setState(() {
          fetching = false;
          timeout = true;
        });
      },
    );
  }

  Widget textWidget(String? text, TextStyle style) {
    if (text == null) return SizedBox();
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }

  Widget relatedEntityWidget(
      GNewsListData_newsList_nodes_relatedEntity relatedEntity) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        NetWorkImage(
          image: relatedEntity.portraitURL ?? "",
          size: 24.sp,
          margin: EdgeInsets.only(right: 4.w),
        ),
        Text(
          relatedEntity.entityName,
          style: bodyText2.copyWith(color: Pigment.fromString('#666666')),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      query();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (fetching) return CircularProgress(size: 24.sp);
    return timeout
        ? Empty404(
            reload: () {
              setState(() => fetching = true);
              query();
            },
          )
        : PanelWrapper(
            onRefresh: () async {
              _completer = new Completer();
              query();
              return _completer!.future;
            },
            itemCount: news.length,
            itemBuilder: (context, index) => InfoFlowItem(
              onTap: () {
                String url = news[index].link ?? "";
                String title = news[index].title ?? "";
                router.navigateTo(
                  context,
                  '${Routes.webview}?url=${Uri.encodeComponent(url)}&title=${Uri.encodeComponent(title)}',
                );
              },
              title: news[index].title,
              content: news[index].abstract,
              source: news[index].source,
              publishTime: news[index].publishTime != null
                  ? news[index].publishTime! + "000"
                  : null,
              shareable: false,
              // relatedEntity: news[index].relatedEntity.toList(),
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
