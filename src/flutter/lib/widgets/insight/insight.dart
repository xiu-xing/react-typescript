import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/ac/utils.dart';
import 'package:rime_app/widgets/common/appbar/preferred_size_bar.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/common/custom_icons/custom_icons.dart';
import 'package:rime_app/widgets/common/static_search_field.dart';
import 'package:rime_app/widgets/webview_page.dart';

class Insight extends StatefulWidget {
  Insight({Key? key}) : super(key: key);

  @override
  _InsightState createState() => _InsightState();
}

class _InsightState extends State<Insight>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<String> _tabs = ['硬科技', '风口赛道'];
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    EventBusUtil.listen<SwitchSkeletonNavigationBarEvent>((event) {
      if (event.tabId == "hard-tech")
        _controller!.animateTo(0);
      else
        _controller!.animateTo(1);
    });
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSizeBar(
        overlayStyle: SystemUiOverlayStyle.dark,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          // height: 36.h,
          child: GestureDetector(
            onTap: () => router.navigateTo(context, Routes.quickSearch),
            child: StaticSearchField(),
          ),
        ),
      ),
      body: Column(
        children: [
          CommonTabBar(
            controller: _controller,
            tabs: _tabs,
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Selector<UserProvider, Role>(
                  selector: (c, p) => p.userRole,
                  builder: (c, r, _) {
                    if (r == Role.vip) {
                      return WebviewPage(
                        hideAppbar: true,
                        url: '$WEB_ENDPOINT/mobile/vertical/hard-tech',
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/hard_tech@2x.png",
                            width: 125.w,
                            height: 139.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 35.w,
                          ),
                          Text(
                            "按硬科技 十大领域 细化分类",
                            style: subtitle1.copyWith(
                              color: grey33,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Text(
                            "独家整理出完整的硬科技赛道谱系",
                            style: subtitle1.copyWith(color: grey73),
                          ),
                          Text(
                            "帮助您发现、了解有价值的前沿硬科技",
                            style: subtitle1.copyWith(color: grey73),
                          ),
                          SizedBox(
                            height: 6.w,
                          ),
                          TextButton.icon(
                            onPressed: () =>
                                router.navigateTo(context, Routes.payment),
                            icon: Text(
                              "升级会员",
                              style: subtitle1.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            label: Icon(
                              CustomIcons.halfchenvronright,
                              color: primaryColor,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                WebviewPage(
                  hideAppbar: true,
                  url: '$WEB_ENDPOINT/mobile/vertical/detection',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
