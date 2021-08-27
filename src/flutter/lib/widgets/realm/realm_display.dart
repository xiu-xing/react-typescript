import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/graphql/queries/realm/realm.data.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/load_config.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/realm/condition_menu_icon.dart';
import 'package:rime_app/widgets/realm/condition_tip.dart';
import 'package:rime_app/widgets/realm/result_list/result_list.dart';

class RealmDisplay extends StatefulWidget {
  @override
  _RealmDisplayState createState() => _RealmDisplayState();

  RealmDisplay({Key? key, required this.realms}) : super(key: key);

  final List<GAppRealmData_appRealms> realms;
}

class _RealmDisplayState extends State<RealmDisplay>
    with SingleTickerProviderStateMixin {
  bool hasCondition = true;
  TabController? _controller;
  Map<String, int> _tabConditionCountMap = Map();
  GlobalKey<FilterButtonState> conditionMenuKey = new GlobalKey();
  GlobalKey<RealmConditionTipState> _realmConditionTipKey = new GlobalKey();
  Map<String, GlobalKey<RealmResultsState>> _tabBarViewGlobalKey = Map();
  StreamSubscription? _eventBusListener;

  Widget tabsWidget(BuildContext _context) {
    if (widget.realms.length == 0) return SizedBox();

    List<String> tabs = widget.realms.map((e) => e.name).toList();
    return Stack(
      children: [
        CommonTabBar(
          tabBarPadding: EdgeInsets.only(right: 56.w),
          tabs: tabs,
          controller: _controller,
          isScrollable: true,
          elevation: 1,
          onTap: (int index) {
            MuseEventUtil.sendEvent(
                eventId: MuseEventUtil.RealmTabBarId,
                value: {
                  "tabs_item": {"value": tabs[index]},
                  "tabs_id": {"value": widget.realms[index].id}
                });
          },
        ),
        Positioned(
          right: 36.w,
          bottom: 10,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              width: 29.w,
              height: 44,
              color: Colors.white.withOpacity(0.94),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: ConditionMenuIcon(
            key: conditionMenuKey,
            onTap: () {
              int index = _controller!.index;
              _tabBarViewGlobalKey[widget.realms[index].id]
                  ?.currentState
                  ?.tuneButtonOnTap(widget.realms[index]);
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: widget.realms.length);

    _controller?.addListener(() {
      _hasConditions();
    });

    _eventBusListener =
        EventBusUtil.listen<SwitchSkeletonNavigationBarEvent>((event) {
      if (_controller == null) return;
      int tabIndex = widget.realms.indexWhere((r) => r.id == event.tabId);
      if (tabIndex != -1) _controller!.animateTo(tabIndex);
    });

    widget.realms.forEach((v) {
      _tabBarViewGlobalKey.putIfAbsent(v.id, () => GlobalKey());
    });

    // 初始化
    if (_tabBarViewGlobalKey.length > 0) _hasConditions();
  }

  @override
  void dispose() {
    _eventBusListener?.cancel();
    super.dispose();
  }

  void _hasConditions() async {
    if (_controller!.index == _controller!.animation?.value) {
      GAppRealmData_appRealms realms = widget.realms[_controller!.index];
      List<GAppRealmData_appRealms_orderColumns>? orderColumns =
          realms.orderColumns?.toList();
      var configMap = await getConfig(REALM_CONDITION_CONFIG);
      if (configMap != null && configMap[realms.id] != null ||
          (orderColumns != null && orderColumns.isNotEmpty)) {
        hasCondition = true;
      } else {
        hasCondition = false;
      }
      if (_tabConditionCountMap
          .containsKey(widget.realms[_controller?.index ?? 0].id)) {
        conditionMenuKey.currentState
            ?.updateMenuButtonActiveColor(primaryColor);
        _realmConditionTipKey.currentState?.updateCount(
            _tabConditionCountMap[widget.realms[_controller?.index ?? 0].id]!);
      } else {
        conditionMenuKey.currentState
            ?.updateMenuButtonActiveColor(Pigment.fromString("#666"));
        _realmConditionTipKey.currentState?.updateCount(0);
      }
      conditionMenuKey.currentState?.updateMenuButtonState(!hasCondition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabsWidget(context),
        RealmConditionTip(
          key: _realmConditionTipKey,
          onTap: () {
            int index = _controller!.index;
            _tabBarViewGlobalKey[widget.realms[index].id]
                ?.currentState
                ?.tuneButtonOnTap(widget.realms[index]);
          },
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: tabBarViewChildren(),
          ),
        ),
      ],
    );
  }

  List<Widget> tabBarViewChildren() {
    if (_tabBarViewGlobalKey.length == 0) return [];
    return widget.realms.map((v) {
      return RealmResults(
        key: _tabBarViewGlobalKey[v.id],
        realmId: v.id,
        conditionOnChangeCallBack: (id, conditionCount) {
          if (conditionCount > 0) {
            setState(() => _tabConditionCountMap[id] = conditionCount);
          } else {
            setState(
                () => _tabConditionCountMap.removeWhere((key, _) => key == id));
          }

          if (id == widget.realms[_controller?.index ?? 0].id) {
            conditionMenuKey.currentState?.updateMenuButtonActiveColor(
                conditionCount > 0 ? primaryColor : disabledColor);
            _realmConditionTipKey.currentState?.updateCount(conditionCount);
          }
        },
      );
    }).toList();
  }
}
