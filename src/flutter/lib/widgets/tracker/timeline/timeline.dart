import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/widgets/common/empty/empty.dart';
import 'package:rime_app/widgets/common/loading/loading.dart';
import 'package:rime_app/widgets/tracker/provider.dart';
import 'package:rime_app/widgets/tracker/timeline/filter_item.dart';
import 'package:rime_app/widgets/tracker/timeline/timeline_panel.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.req.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.var.gql.dart';

class TrackerTimeline extends StatefulWidget {
  const TrackerTimeline({Key? key, required this.trackerTheme})
      : super(key: key);

  final GTrackerTheme trackerTheme;
  @override
  _TrackerTimelineState createState() => _TrackerTimelineState();
}

class _TrackerTimelineState extends State<TrackerTimeline> {
  List<TrackerTimelineTab> tabs = [];
  String currentSelected = "";
  bool fetching = true;
  PageController _pageController = PageController();

  GSelectorFilterInput marshalToInput(String value) {
    GSelectorFilterInputBuilder builder = GSelectorFilterInputBuilder();
    builder.filterID = "tracker_tag_selector_filter_id";
    builder.filterValue = value;
    GSelectorFilterInput input = builder.build();
    return input;
  }

  void getTrackerTab() {
    GQL.executeQuery<GAppTrackerTabsData, GAppTrackerTabsVars>(
        GAppTrackerTabsReq((b) => b
          ..requestId = "TrackerTabs${widget.trackerTheme.name}"
          ..vars.trackerTheme = widget.trackerTheme), onData: (s, r) {
      s.cancel();
      setState(() => fetching = false);

      if (r.data?.appTrackerTabs == null) return;
      List<TrackerTimelineTab> tempTabs = [];
      r.data!.appTrackerTabs.forEach((v) {
        TrackerTimelineTab tab = TrackerTimelineTab(v);
        tempTabs.add(tab);
      });
      if (mounted && tempTabs.length > 0)
        setState(() {
          tabs = tempTabs;
          currentSelected = tabs[0].name ?? "";
        });
    }, onError: (s, e) {
      s.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getTrackerTab();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (fetching) {
      return Center(child: Loading(scale: .4));
    }
    if (tabs.length > 0)
      return Material(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 40.h,
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 12.w),
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (c, i) {
                  return TrackerTimelineFilterItem(
                    text: tabs[i].name ?? "",
                    isSelect: tabs[i].name == currentSelected,
                    onTap: (v) {
                      MuseEventUtil.sendEvent(
                          eventId: MuseEventUtil.TrackerTabsItemTabBarId,
                          value: {
                            "tabs_item": {"value": v},
                            "tabs_id": {"value": tabs[i].id}
                          });
                      setState(() => currentSelected = v);
                      int index =
                          tabs.indexWhere((e) => e.name == currentSelected);
                      _pageController.jumpToPage(index);
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: tabs.map((e) {
                  return Selector<TrackerProvider, String>(
                    selector: (c, p) => p.selectTag,
                    builder: (c, tag, _) {
                      return TrackerTimelinePanel(
                        id: e.id ?? "",
                        filter: tag == "" ? null : [marshalToInput(tag)],
                        trackerTheme: widget.trackerTheme,
                        isCurrent: e.name == currentSelected,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );

    return Center(child: Empty(scale: 0.5));
  }
}

class TrackerTimelineTab {
  String? name;
  String? id;

  TrackerTimelineTab(GAppTrackerTabsData_appTrackerTabs t) {
    if (t is GAppTrackerTabsData_appTrackerTabs__asTimelineTab) {
      this.id = t.timelineID;
      this.name = t.name;
    }
  }
}
