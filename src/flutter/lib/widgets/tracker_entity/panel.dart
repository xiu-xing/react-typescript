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
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/dialog/untracked_check_dialog.dart';
import 'package:rime_app/widgets/common/list_widget/list_widget_next.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/common/slide_button/listener.dart';
import 'package:rime_app/widgets/common/slide_button/slide_button_item_next.dart';
import 'package:rime_app/widgets/common/slide_button/slide_button_next.dart';
import 'package:rime_app/widgets/common/snack_bar.dart';
import 'package:rime_app/widgets/tracker/recommendation/recommendation.dart';

class TrackerEntityPanel extends StatefulWidget {
  const TrackerEntityPanel({
    Key? key,
    required this.trackerTheme,
    required this.totalCountChange,
  }) : super(key: key);

  final GTrackerTheme trackerTheme;
  final ValueChanged<int?> totalCountChange;
  @override
  _TrackerEntityPanelState createState() => _TrackerEntityPanelState();
}

class _TrackerEntityPanelState extends State<TrackerEntityPanel> {
  StreamSubscription? _trackedEntitiesSubscription;
  StreamSubscription? _unTrackEntityByEntityIDSubscription;
  StreamSubscription? _eventBusListener;
  String endCursor = "";
  EasyRefreshController _controller = EasyRefreshController();
  List<GTrackedEntitiesData_trackedEntities_nodes> _nodes = [];
  bool needRecommendation = false;
  late LeftScrollCloseTag tag;

  GTrackedEntitiesReq request() {
    return GTrackedEntitiesReq((b) => b
      ..requestId = "TrackedEntitiesData${widget.trackerTheme}"
      ..vars.first = 25
      ..vars.trackerTheme = widget.trackerTheme);
  }

  void getTrackedEntities() {
    if (_trackedEntitiesSubscription != null) return;
    _trackedEntitiesSubscription =
        GQL.executeQuery<GTrackedEntitiesData, GTrackedEntitiesVars>(
      request(),
      onData: (stream, response) {
        if (response.data?.trackedEntities == null) return;
        _controller.finishRefresh(success: true);
        _controller.finishLoad(success: true);
        widget.totalCountChange(response.data?.trackedEntities?.totalCount);

        if ((response.data?.trackedEntities?.totalCount ?? 0) == 0) {
          // EventBusUtil.fire(TrackedEntityEvent(widget.trackerTheme));
          setState(() => needRecommendation = true);
        } else {
          if (needRecommendation) setState(() => needRecommendation = false);
        }
        _nodes = response.data!.trackedEntities?.nodes?.toList() ?? [];
        if (response.data!.trackedEntities?.pageInfo.hasNextPage ?? false) {
          endCursor = response.data!.trackedEntities!.pageInfo.endCursor!;
        } else {
          endCursor = "";
        }
        if (mounted) setState(() {});
      },
      onError: (stream, error) {
        _controller.finishRefresh(success: false);
        _controller.finishLoad(success: false);
      },
    );
  }

  Future<void> loadMore() async {
    if (endCursor == "") return;
    final nextReq = request().rebuild(
      (b) => b
        ..vars.after = endCursor
        ..updateResult = (previous, next) =>
            previous?.rebuild((b) {
              if (next?.trackedEntities == null ||
                  next?.trackedEntities?.pageInfo == null) return previous;
              return b.trackedEntities
                ..pageInfo.replace(next!.trackedEntities!.pageInfo)
                ..nodes.addAll(next.trackedEntities?.nodes?.toList() ?? []);
            }) ??
            next,
    );
    GQL.ferryClient.requestController.add(nextReq);
  }

  Future<void> refresh() async {
    if (_trackedEntitiesSubscription != null) {
      GQL.ferryClient.requestController.add(request());
    } else {
      getTrackedEntities();
    }
  }

  void unTrackEntityByEntityID(
    String entityID,
    GEntityType entityType,
    void Function() onSuccess,
  ) {
    GUnTrackEntityByEntityIDReq req = GUnTrackEntityByEntityIDReq((b) => b
      ..requestId = "UnTrackEntityByEntityID${widget.trackerTheme}2"
      ..vars.entity.entityId = entityID
      ..vars.entity.entityType = entityType);
    if (_unTrackEntityByEntityIDSubscription == null) {
      _unTrackEntityByEntityIDSubscription = GQL.executeQuery<
          GUnTrackEntityByEntityIDData, GUnTrackEntityByEntityIDVars>(
        req,
        onData: (s, r) {
          if (r.data?.appUnTrackEntityByEntityID == true) {
            onSuccess();
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBarWidget.unTrackedFail);
          }
        },
      );
    } else {
      GQL.ferryClient.requestController.add(req);
    }
  }

  Widget slideButtonWidget(
    GTrackedEntitiesData_trackedEntities_nodes node,
    int index,
  ) {
    Key key = Key("$index");
    tag = LeftScrollCloseTag('trackerentity${widget.trackerTheme}');
    return SlideButtonNext(
      key: key,
      buttonWidth: 96,
      closeTag: tag,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NetWorkImage(image: node.portraitURL ?? "", size: 24.w),
            SizedBox(width: 6.w),
            Text(
              node.entityName,
              style: bodyText1.copyWith(
                color: Pigment.fromString("#666"),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        SlideButtonListener.instance?.needCloseOtherRowOfTag(tag, null);
        router.navigateTo(
          context,
          '${Routes.profile}?id=${node.entityId}&type=${node.entityType}',
        );
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
            if (node.entityId != null)
              showDialog(
                context: context,
                builder: (context) {
                  return UnTrackedCheckDialog(
                    name: node.entityName,
                    onSubmit: () {
                      unTrackEntityByEntityID(
                        node.entityId!,
                        node.entityType,
                        refresh,
                      );
                    },
                  );
                },
              );
            MuseEventUtil.sendEntity(
                eventId: MuseEventUtil.CancelTrackerId,
                entityId: node.entityId ?? "",
                entityType: node.entityType.toString());
            SlideButtonListener.instance?.targetStatus(tag, key)?.value = false;
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    _eventBusListener = EventBusUtil.listen<TrackedEntityEvent>((event) {
      if (event.trackerTheme == widget.trackerTheme) refresh();
    });
    super.initState();
  }

  @override
  void dispose() {
    _trackedEntitiesSubscription?.cancel();
    _unTrackEntityByEntityIDSubscription?.cancel();
    _eventBusListener?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            SlideButtonListener.instance?.needCloseOtherRowOfTag(tag, null);
          },
          child: Stack(
            children: [
              ListWidgetNext(
                controller: _controller,
                onRefreshCallback: refresh,
                onLoadCallback: loadMore,
                canLoad: endCursor != "",
                itemCount: _nodes.length,
                itemBuilder: (context, index) {
                  return slideButtonWidget(_nodes[index], index);
                },
              ),
              needRecommendation
                  ? Material(
                      color: Colors.white,
                      child: TrackerRecommendation(
                          trackerTheme: widget.trackerTheme),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
