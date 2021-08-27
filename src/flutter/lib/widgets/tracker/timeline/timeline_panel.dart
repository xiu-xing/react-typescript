import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/mutations/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/mutations/tracker/tracker.req.gql.dart';
import 'package:rime_app/graphql/mutations/tracker/tracker.var.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.req.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/permission.dart';
import 'package:rime_app/widgets/common/ac/ac.dart';
import 'package:rime_app/widgets/common/dialog/untracked_check_dialog.dart';
import 'package:rime_app/widgets/common/list_widget/list_widget_next.dart';
import 'package:rime_app/widgets/common/slide_button/listener.dart';
import 'package:rime_app/widgets/common/slide_button/slide_button_item_next.dart';
import 'package:rime_app/widgets/common/slide_button/slide_button_next.dart';
import 'package:rime_app/widgets/common/snack_bar.dart';
import 'package:rime_app/widgets/tracker/timeline/timeline_item.dart';

class TrackerTimelinePanel extends StatefulWidget {
  const TrackerTimelinePanel({
    Key? key,
    required this.id,
    this.filter,
    required this.trackerTheme,
    required this.isCurrent,
  }) : super(key: key);
  final String id;
  final List<GSelectorFilterInput>? filter;
  final GTrackerTheme trackerTheme;
  final bool isCurrent;

  @override
  _TrackerTimelinePanelState createState() => _TrackerTimelinePanelState();
}

class _TrackerTimelinePanelState extends State<TrackerTimelinePanel>
    with AutomaticKeepAliveClientMixin {
  StreamSubscription? query;
  StreamSubscription? unTrackEntityQuery;
  String endCursor = "";
  EasyRefreshController _controller = new EasyRefreshController();
  bool lock = false;
  bool isNeedFolded = false;

  List<GAppTrackerTimelineData_appTrackerTimeline_nodes> nodes = [];

  GAppTrackerTimelineReq getTimelieReq() {
    GAppTrackerTimelineReq req = GAppTrackerTimelineReq((b) => b
      ..requestId = "AppTrackerTimeline${widget.id}"
      ..vars.first = 10
      ..vars.timelineID = widget.id
      ..vars.trackerTheme = widget.trackerTheme);

    if (widget.filter != null && widget.filter?.length != 0) {
      req = req.rebuild(
          (b) => b.vars.filters.selectorFilterInputs.replace(widget.filter!));
    }

    return req;
  }

  void getCount() {
    GQL.executeQuery<GTrackedEntityCountData, GTrackedEntityCountVars>(
        GTrackedEntityCountReq((b) => b
          ..requestId = "TrackedEntityCount2${widget.trackerTheme}"
          ..vars.trackerTheme = widget.trackerTheme), onData: (s, r) {
      s.cancel();
      if (r.data?.appTrackedEntityCount?.count == 0) {
        EventBusUtil.fire(TrackedEntityEvent(widget.trackerTheme));
      }
    });
  }

  void getTimeline() {
    if (query != null) return;

    query = GQL.executeQuery<GAppTrackerTimelineData, GAppTrackerTimelineVars>(
      getTimelieReq(),
      onData: (s, r) {
        if (r.data?.appTrackerTimeline == null ||
            r.data!.appTrackerTimeline?.pageInfo == null) return;

        isNeedFolded = r.data?.appTrackerTimeline?.isNeedFolded ?? false;
        bool permission = false;
        if (r.data?.appTrackerTimeline?.permissions != null &&
            r.data!.appTrackerTimeline!.permissions!.isNotEmpty) {
          var list = r.data!.appTrackerTimeline!.permissions!.toList();
          list.forEach((p) {
            permission = PermissionUtils.getPermission(p);
            if (permission && widget.isCurrent) {
              context.showAC(type: ACDialogType.LoadLimit, message: "资源受限");
            }
          });
        }
        if (permission) {
          _controller.finishRefresh(success: false);
          _controller.finishLoad(success: false);
          return;
        }
        if (r.data!.appTrackerTimeline!.pageInfo?.hasNextPage == true) {
          endCursor = r.data!.appTrackerTimeline!.pageInfo!.endCursor!;
        } else {
          endCursor = "";
        }
        nodes = r.data!.appTrackerTimeline!.nodes?.toList() ?? [];
        _controller.finishRefresh(success: true);
        _controller.finishLoad(success: true);

        setState(() {});
      },
      onError: (s, e) {
        _controller.finishRefresh(success: false);
        _controller.finishLoad(success: false);
      },
    );
  }

  void untrackerEntity(
    String entityID,
    GEntityType entityType,
    void Function() onSuccess,
  ) {
    GUnTrackEntityByEntityIDReq req = GUnTrackEntityByEntityIDReq((b) => b
      ..requestId = "UnTrackEntityByEntityID${widget.trackerTheme}"
      ..vars.entity.entityId = entityID
      ..vars.entity.entityType = entityType);
    if (unTrackEntityQuery == null) {
      unTrackEntityQuery = GQL.executeQuery<GUnTrackEntityByEntityIDData,
          GUnTrackEntityByEntityIDVars>(req, onData: (s, r) {
        if (r.data?.appUnTrackEntityByEntityID == true) {
          onSuccess();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBarWidget.unTrackedFail);
        }
      });
    } else {
      GQL.ferryClient.requestController.add(req);
    }
  }

  Future<void> loadMore() async {
    if (endCursor == "") return;
    final nextReq = getTimelieReq().rebuild(
      (b) => b
        ..vars.after = endCursor
        ..vars.first = 20
        ..updateResult = (previous, next) {
          if (next?.appTrackerTimeline == null) return next;
          return previous?.rebuild((b) => b.appTrackerTimeline
            ..pageInfo.replace(next!.appTrackerTimeline!.pageInfo ??
                previous.appTrackerTimeline!.pageInfo!)
            ..permissions
                .replace(next.appTrackerTimeline?.permissions?.toList() ?? [])
            ..nodes.addAll(next.appTrackerTimeline?.nodes?.toList() ?? []));
        },
    );
    GQL.ferryClient.requestController.add(nextReq);
  }

  Future<void> refresh() async {
    if (query != null) {
      GQL.ferryClient.requestController.add(getTimelieReq());
    } else {
      getTimeline();
    }
  }

  Widget slideButtonWidgetNext(
      GAppTrackerTimelineData_appTrackerTimeline_nodes node, int index) {
    Key key = Key("$index");
    LeftScrollCloseTag tag = LeftScrollCloseTag(
      'timelineslidebutton${widget.id}',
    );
    return SlideButtonNext(
      key: key,
      buttonWidth: 96,
      closeTag: tag,
      child: TrackerTimelineItem(node: node, isNeedFolded: isNeedFolded),
      onTap: () {
        SlideButtonListener.instance?.needCloseOtherRowOfTag(tag, null);
      },
      buttons: <Widget>[
        SlideButtonItem(
          text: '放弃追踪',
          style: subtitle1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          backgrounColor: Pigment.fromString("#191919").withOpacity(0.5),
          onTap: () {
            if (node.entity?.entityId == null ||
                node.entity?.entityType == null) return;
            showDialog(
              context: context,
              builder: (context) {
                return UnTrackedCheckDialog(
                  name: node.entity?.entityName ?? "",
                  onSubmit: () {
                    untrackerEntity(
                      node.entity!.entityId!,
                      node.entity!.entityType,
                      () {
                        refresh();
                        getCount();
                      },
                    );
                  },
                );
              },
            );
            SlideButtonListener.instance?.targetStatus(tag, key)?.value = false;
            MuseEventUtil.sendEntity(
              eventId: MuseEventUtil.CancelTrackerId,
              entityId: node.entity?.entityId ?? "",
              entityType: node.entity?.entityType.toString() ?? "",
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    query?.cancel();
    unTrackEntityQuery?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getTimeline();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TrackerTimelinePanel oldWidget) {
    if (oldWidget.filter != widget.filter) {
      refresh();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Material(
      color: Colors.white,
      child: ListWidgetNext(
        controller: _controller,
        canLoad: endCursor != "",
        onLoadCallback: loadMore,
        onRefreshCallback: refresh,
        itemCount: nodes.length,
        itemBuilder: (c, i) => slideButtonWidgetNext(nodes[i], i),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
