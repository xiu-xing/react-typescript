import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.req.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/graphql/mutations/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/mutations/tracker/tracker.req.gql.dart';
import 'package:rime_app/graphql/mutations/tracker/tracker.var.gql.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rime_app/widgets/common/ac/ac.dart';
import 'package:rime_app/widgets/common/icon_button.dart';
import 'package:rime_app/widgets/common/snack_bar.dart';

/// 只能用于详情页，其他请另写。
class TrackAction extends StatefulWidget {
  const TrackAction({
    Key? key,
    required this.entityID,
    required this.entityType,
  }) : super(key: key);
  final String entityID;
  final GEntityType entityType;

  @override
  _TrackActionState createState() => _TrackActionState();
}

class _TrackActionState extends State<TrackAction> {
  StreamSubscription? _unTrackEntityByEntityIDSubscription;
  StreamSubscription? _trackEntitySubscription;
  StreamSubscription? _eventBusListener;
  bool isTracked = false;
  GTrackerTheme trackerTheme = GTrackerTheme.TRACKER_THEME_UNSPECIFIED;

  void getTrackableTheme() {
    GQL.executeQuery<GTrackableThemeData, GTrackableThemeVars>(
        GTrackableThemeReq((b) => b
          ..requestId = 'TrackableTheme${widget.entityID}'
          ..vars.entityID = widget.entityID
          ..vars.entityType = widget.entityType), onData: (stream, response) {
      stream.cancel();
      if (response.hasErrors || response.data?.appTrackableTheme == null)
        return;
      setState(() {
        trackerTheme = response.data!.appTrackableTheme!.trackerTheme;
        isTracked = response.data!.appTrackableTheme!.isTracked;
      });
    });
  }

  void unTrackEntityByEntityID() {
    GUnTrackEntityByEntityIDReq reques = GUnTrackEntityByEntityIDReq((b) => b
      ..requestId = "UnTrackEntityByEntityID${widget.entityID}"
      ..vars.entity.entityId = widget.entityID
      ..vars.entity.entityType = widget.entityType);
    if (_unTrackEntityByEntityIDSubscription == null) {
      _unTrackEntityByEntityIDSubscription = GQL.executeQuery<
          GUnTrackEntityByEntityIDData, GUnTrackEntityByEntityIDVars>(
        reques,
        onData: (s, r) {
          if (r.data?.appUnTrackEntityByEntityID == true) {
            EventBusUtil.fire(TrackedEntityStatusEvent(widget.entityID, false));
            setState(() => isTracked = false);
            showToast("已取消追踪");
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBarWidget.unTrackedFail);
          }
        },
      );
    } else {
      GQL.ferryClient.requestController.add(reques);
    }
  }

  void trackEntity() {
    GEntityInputBuilder entityinput = GEntityInputBuilder();
    entityinput.entityId = widget.entityID;
    entityinput.entityType = widget.entityType;

    GTrackEntityReq reques = GTrackEntityReq((b) => b
      ..requestId = "trackEntity${widget.entityID}"
      ..vars.entities.replace([entityinput.build()])
      ..vars.trackerTheme = trackerTheme);
    if (_trackEntitySubscription == null) {
      _trackEntitySubscription = GQL
          .executeQuery<GTrackEntityData, GTrackEntityVars>(reques,
              onData: (s, r) {
        if (r.data?.appTrackEntity == true) {
          EventBusUtil.fire(TrackedEntityStatusEvent(widget.entityID, true));
          setState(() => isTracked = true);
          showToast("追踪成功");
        }
      }, onError: (s, e) {
        if (e[0].message.contains("资源受限")) {
          context.showAC(type: ACDialogType.TrackLimit, message: "资源受限");
        }
      });
    } else {
      GQL.ferryClient.requestController.add(reques);
    }
  }

  @override
  void initState() {
    super.initState();
    getTrackableTheme();
  }

  @override
  void dispose() {
    _unTrackEntityByEntityIDSubscription?.cancel();
    _trackEntitySubscription?.cancel();
    _eventBusListener?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _eventBusListener = EventBusUtil.listen<TrackedEntityStatusEvent>((event) {
      // 在栈顶
      if (!mounted) return;
      if (ModalRoute.of(context)?.isCurrent ?? true) return;

      if (event.id != widget.entityID) return;

      setState(() => isTracked = event.isTracked);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (trackerTheme == GTrackerTheme.TRACKER_THEME_UNSPECIFIED)
      return SizedBox();
    if (isTracked)
      return CommonIconButton(
        icon: Icon(
          MdiIcons.check,
          color: Pigment.fromString("#333"),
          size: 24.sp,
        ),
        onTap: unTrackEntityByEntityID,
        size: 36.sp,
      );
    return CommonIconButton(
      icon: Icon(
        MdiIcons.targetVariant,
        color: Pigment.fromString("#333"),
        size: 24.sp,
      ),
      onTap: trackEntity,
      size: 36.sp,
    );
  }
}
