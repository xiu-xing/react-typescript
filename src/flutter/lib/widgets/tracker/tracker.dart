import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.req.gql.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/preferred_size_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/tracker/condition.dart';
import 'package:rime_app/widgets/tracker/provider.dart';
import 'package:rime_app/widgets/tracker/tracker_body.dart';

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _controller;
  int currentTabIndex = 0;
  double iconWidth = 56;

  List<GTrackerTheme> themeList = [
    GTrackerTheme.TRACKER_THEME_ENTERPRISE,
    GTrackerTheme.TRACKER_THEME_INSTITUTION,
    GTrackerTheme.TRACKER_THEME_VERTICAL
  ];

  void getFilter() {
    GQL.executeQuery<GTrackTagsData, GTrackTagsVars>(
        GTrackTagsReq((b) => b
          ..requestId = "GetTrackTags"
          ..vars.trackerTheme = GTrackerTheme.TRACKER_THEME_ENTERPRISE),
        context: context, onData: (s, r) {
      s.cancel();
    }, onError: (s, e) {
      s.cancel();
      setState(() => iconWidth = 0);
    });
  }

  Widget appbarWidget() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - iconWidth.w,
          child: CommonTabBar(
            tabs: ["项目企业", "投资机构", "行业赛道"],
            controller: _controller,
            elevation: 0,
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: notoSansSC,
            ),
            onTap: (index) {
              setState(() => currentTabIndex = index);
            },
          ),
        ),
        if (iconWidth != 0)
          TrackerTagsConditions(theme: themeList[currentTabIndex]),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getFilter();
    _controller = TabController(length: themeList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<TrackerProvider>.value(
      value: TrackerProvider(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSizeBar(
          overlayStyle: SystemUiOverlayStyle.dark,
          height: 44.h,
          backgroundColor: Colors.white,
          child: appbarWidget(),
        ),
        body: TabBarView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: themeList.map((t) => TrackerBody(trackerTheme: t)).toList(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
