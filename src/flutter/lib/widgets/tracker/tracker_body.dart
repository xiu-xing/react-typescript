import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.req.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/loading/loading.dart';
import 'package:rime_app/widgets/tracker/recommendation/provider.dart';
import 'package:rime_app/widgets/tracker/recommendation/recommendation.dart';
import 'package:rime_app/widgets/tracker/timeline/timeline.dart';

class TrackerBody extends StatefulWidget {
  const TrackerBody({Key? key, required this.trackerTheme}) : super(key: key);
  final GTrackerTheme trackerTheme;

  @override
  _TrackerBodyState createState() => _TrackerBodyState();
}

class _TrackerBodyState extends State<TrackerBody>
    with AutomaticKeepAliveClientMixin {
  bool? emptyTracked;
  bool error = false;
  StreamSubscription? _eventBusListener;

  void getTrackerCount() {
    if (emptyTracked != null) setState(() => emptyTracked = null);
    GQL.executeQuery<GTrackedEntityCountData, GTrackedEntityCountVars>(
      GTrackedEntityCountReq((b) => b
        ..requestId = "trackedEntityCount${widget.trackerTheme.name}"
        ..vars.trackerTheme = widget.trackerTheme),
      onData: (s, r) {
        s.cancel();
        if (r.data?.appTrackedEntityCount?.count == null) return;
        if (mounted && error) setState(() => error = false);
        if (r.data!.appTrackedEntityCount!.count == 0 && emptyTracked != true) {
          if (mounted) setState(() => emptyTracked = true);
        } else {
          if (mounted) setState(() => emptyTracked = false);
        }
      },
      onError: (s, e) {
        s.cancel();
        setState(() {
          error = true;
          emptyTracked = false;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getTrackerCount();
    });
    _eventBusListener = EventBusUtil.listen<TrackedEntityEvent>((event) {
      if (event.trackerTheme == widget.trackerTheme) getTrackerCount();
    });
  }

  @override
  void dispose() {
    _eventBusListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (emptyTracked == null) return Center(child: Loading(scale: 0.4));
    if (error) return Empty404(reload: getTrackerCount);
    if (emptyTracked!) {
      return ChangeNotifierProvider<TrackRecommendationProvider>.value(
        value: TrackRecommendationProvider(),
        child: TrackerRecommendation(trackerTheme: widget.trackerTheme),
      );
    } else {
      return TrackerTimeline(trackerTheme: widget.trackerTheme);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
