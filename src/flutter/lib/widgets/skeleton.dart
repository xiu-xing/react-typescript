import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/formatter.dart';
import 'package:rime_app/widgets/account/account.dart';
import 'package:rime_app/widgets/common/custom_icons/custom_icons.dart';
import 'package:rime_app/widgets/discovery/discovery.dart';
import 'package:rime_app/widgets/realm/realm.dart';
import 'package:rime_app/widgets/tracker/tracker.dart';
import 'package:uni_links/uni_links.dart';

import 'insight/insight.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  _SkeletonState createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  StreamSubscription? _linkStreamSubscription;
  StreamSubscription? _connectivityStreamSubscription;
  StreamSubscription? _eventBusListener;
  StreamSubscription? _userRoleEventBusListener;

  PageController _pageController = PageController(initialPage: 0);

  static Widget iconWrapper(Widget child) {
    return Container(width: 24.w, height: 24.w, child: child);
  }

  final List<SkeletonPage> pages = [
    SkeletonPage(
      pageName: "discovery",
      bottomNavigationBarItem: BottomNavigationBarItem(
        label: '发现',
        icon: iconWrapper(Icon(CustomIcons.safari, size: 22.w)),
      ),
      pageWidget: Discovery(),
    ),
    SkeletonPage(
      pageName: "insight",
      bottomNavigationBarItem: BottomNavigationBarItem(
        label: '洞察',
        icon: iconWrapper(Icon(CustomIcons.tv, size: 22.w)),
      ),
      pageWidget: Insight(),
    ),
    SkeletonPage(
      pageName: "realm",
      bottomNavigationBarItem: BottomNavigationBarItem(
        label: '数据库',
        icon: iconWrapper(Icon(CustomIcons.magnify_star, size: 24.w)),
      ),
      pageWidget: Realm(),
    ),
    SkeletonPage(
      pageName: "tracker",
      bottomNavigationBarItem: BottomNavigationBarItem(
        label: '追踪',
        icon: iconWrapper(Icon(CustomIcons.track, size: 22.w)),
      ),
      pageWidget: Tracker(),
    ),
    SkeletonPage(
      pageName: "account",
      bottomNavigationBarItem: BottomNavigationBarItem(
        label: '我的',
        icon: iconWrapper(Icon(CustomIcons.accountcircleoutline, size: 16.w)),
      ),
      pageWidget: Account(),
    ),
  ];

  int _currentIndex = 0;

  void initJiffy() async {
    await Jiffy.locale("zh_cn");
  }

  void listener() {
    Global.userProvider.initQuery(context);
    _eventBusListener =
        EventBusUtil.listen<SwitchSkeletonNavigationBarEvent>((event) {
      int index = pages.indexWhere((e) => e.pageName == event.pageName);
      if (index != -1) {
        setState(() => _currentIndex = index);
        _pageController.jumpToPage(_currentIndex);
      }
    });

    _userRoleEventBusListener =
        EventBusUtil.listen<UserFinishPaymentEvent>((event) {
      Global.userProvider.setUser(role: GRole.INDIVIDUAL_PREMIUM);
    });

    _connectivityStreamSubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        Global.userProvider.initQuery(context);
      }
      EventBusUtil.fire(ConnectivityChangeEvent(result));
    });
  }

  Future<void> _initPlatformStateForStringUniLinks() async {
    // Get the latest link
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      var initialLink = await getInitialLink();
      print("initialLink: $initialLink");

      final url = Formatter.getShareUrl(initialLink);

      if (url != "") router.navigateTo(context, url);

      final uniUrl = Formatter.getShareUniUrl(initialLink);

      if (uniUrl != "") router.navigateTo(context, uniUrl);
    } on PlatformException {
      print('Failed to get initial link.');
    }

    // Attach a listener to the links stream
    _linkStreamSubscription = linkStream.listen((link) {
      print("initial link stream: $link");

      final url = Formatter.getShareUrl(link);

      if (url != "") router.navigateTo(context, url);

      final uniUrl = Formatter.getShareUniUrl(link);

      if (uniUrl != "") router.navigateTo(context, uniUrl);
    }, onError: (Object err) {
      print("Failed to get link");
    });
  }

  void checkUserInfo() async {
    bool hasPhone = await Global.checkUserInfo();
    if (!hasPhone) {
      router.navigateTo(context, Routes.verifyPhone, replace: true);
      return;
    }
    bool hasUserPrile = await Global.checkUserProfile();
    if (!hasUserPrile) {
      router.navigateTo(
        context,
        "${Routes.userProfile}?place=home",
        replace: true,
      );
      return;
    }
  }

  @override
  void initState() {
    initJiffy();
    listener();
    _initPlatformStateForStringUniLinks();
    checkUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) {
          if (i == _currentIndex) return;
          setState(() => _currentIndex = i);
          _pageController.jumpToPage(_currentIndex);
        },
        items: pages.map((e) => e.bottomNavigationBarItem).toList(),
        selectedItemColor: highlightColor,
        unselectedItemColor: Pigment.fromString("#CCC"),
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages.map((e) => e.pageWidget).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _linkStreamSubscription?.cancel();
    Global.userProvider.cleanUserModel();
    _connectivityStreamSubscription?.cancel();
    _eventBusListener?.cancel();
    _userRoleEventBusListener?.cancel();
    super.dispose();
  }
}

class SkeletonPage {
  String pageName;
  BottomNavigationBarItem bottomNavigationBarItem;
  Widget pageWidget;

  SkeletonPage(
      {required this.pageName,
      required this.bottomNavigationBarItem,
      required this.pageWidget});
}
