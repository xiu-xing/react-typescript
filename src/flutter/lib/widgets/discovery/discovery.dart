import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/common/static_search_field.dart';
import 'package:rime_app/widgets/common/wrapper/wrapper.dart';
import 'package:rime_app/widgets/discovery/sticky_header.dart';
import 'package:rime_app/widgets/discovery/shortcuts_grid.dart';
import 'package:rime_app/widgets/discovery/tab_panel/latest_deal_list.dart';
import 'package:rime_app/widgets/discovery/tab_panel/news_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

class Discovery extends StatefulWidget {
  const Discovery({Key? key}) : super(key: key);

  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Pigment.fromString("#fff"),
        body: LogoHeaderWrapper(
          child: Column(
            children: [
              Container(
                height: 24.h,
                decoration: BoxDecoration(
                  color: Pigment.fromString("#fff"),
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              Container(
                color: Pigment.fromString("#fff"),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GestureDetector(
                  child: StaticSearchField(),
                  onTap: () {
                    router.navigateTo(context, Routes.quickSearch);
                  },
                ),
              ),
              Expanded(
                child: ExtendedNestedScrollView(
                  onlyOneScrollInBody: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return <Widget>[
                      SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                      ShortcutsGrid(),
                      SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: StickyHeader(
                          CommonTabBar(
                            controller: _tabController,
                            onTap: (index) {
                              MuseEventUtil.sendEvent(
                                eventId: MuseEventUtil.DiscoveryTabsItemId,
                                value: {
                                  "tabs_item": {
                                    "value": "${index == 0 ? "投融事件" : "新闻资讯"}"
                                  }
                                },
                              );
                              setState(() => currentIndex = index);
                            },
                            tabs: ["投融事件", "新闻资讯"],
                            elevation: 1,
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      LatestDealList(),
                      NewsList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
