import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/tracker/recommendation/provider.dart';
import 'package:rime_app/widgets/tracker_entity/panel.dart';

class TrackerEntities extends StatefulWidget {
  const TrackerEntities({Key? key}) : super(key: key);

  @override
  _TrackerEntitiesState createState() => _TrackerEntitiesState();
}

class _TrackerEntitiesState extends State<TrackerEntities>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _enterpriseCount = 0;
  int _institutionCount = 0;
  int _verticalCount = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrackRecommendationProvider>.value(
      value: TrackRecommendationProvider(),
      child: Scaffold(
        appBar: CommonAppbar(
          elevation: 0,
          title: Text(
            "我的追踪",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Pigment.fromString("#333"),
              fontWeight: FontWeight.w500,
              fontFamily: notoSansSC,
              fontSize: 18.sp,
            ),
          ),
          actions: [SizedBox(width: 40.w)],
        ),
        body: Column(
          children: [
            CommonTabBar(
              tabs: [
                "项目企业 ${_enterpriseCount > 0 ? _enterpriseCount : ""}",
                " 投资机构 ${_institutionCount > 0 ? _institutionCount : ""}",
                " 行业赛道 ${_verticalCount > 0 ? _verticalCount : ""}"
              ],
              onTap: (index) {
                setState(() => _currentIndex = index);
              },
              controller: _controller,
            ),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  TrackerEntityPanel(
                    trackerTheme: GTrackerTheme.TRACKER_THEME_ENTERPRISE,
                    totalCountChange: (count) {
                      setState(() => _enterpriseCount = count ?? 0);
                    },
                  ),
                  TrackerEntityPanel(
                    trackerTheme: GTrackerTheme.TRACKER_THEME_INSTITUTION,
                    totalCountChange: (count) {
                      setState(() => _institutionCount = count ?? 0);
                    },
                  ),
                  TrackerEntityPanel(
                    trackerTheme: GTrackerTheme.TRACKER_THEME_VERTICAL,
                    totalCountChange: (count) {
                      setState(() => _verticalCount = count ?? 0);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
