import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/access_control/icon.dart';
import 'package:rime_app/widgets/common/common_tab_bar/tabbar_indicator.dart';

/// 通用的TabBar，带底部分割线，可动画改变高度进行隐藏
class CommonTabBar extends StatefulWidget {
  final double commonHeight = 43;
  final double lineHeight = 1;
  final double totalHeight = 44;

  final List<String> tabs;
  final List<bool>? tabLocked;
  final TabController? controller;
  final ValueChanged<int>? onTap;
  final bool? isScrollable;
  final double? tabWidth;
  final EdgeInsets? labelPadding;
  final EdgeInsets? tabBarPadding;
  final Function? onCloseCallBack;
  final Function? onShowCallBack;
  final double elevation;
  final Decoration? indicatorDecoration;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final List<AlignmentGeometry>? alignments;

  CommonTabBar({
    Key? key,
    required this.tabs,
    this.tabLocked,
    required this.controller,
    this.onTap,
    this.isScrollable,
    this.tabWidth,
    this.labelStyle,
    this.labelPadding,
    this.tabBarPadding,
    this.onCloseCallBack,
    this.onShowCallBack,
    this.elevation = 1,
    this.indicatorDecoration,
    this.unselectedLabelStyle,
    this.alignments,
  })  : assert(tabs.length > 0),
        super(key: key);

  @override
  CommonTabBarState createState() => CommonTabBarState();
}

class CommonTabBarState extends State<CommonTabBar>
    with SingleTickerProviderStateMixin {
  late double height;
  double bottomPadding = 0;

  late AnimationController _animationController;

  void initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0,
      upperBound: widget.commonHeight,
    )..addListener(() {
        if (mounted)
          setState(() {
            height = widget.totalHeight - _animationController.value;
          });
      });
  }

  @override
  void initState() {
    height = widget.totalHeight;
    initAnimationController();
    super.initState();
  }

  void closed() {
    if (height != widget.totalHeight) return;
    _animationController.forward().whenComplete(() {
      if (mounted) setState(() => bottomPadding = widget.lineHeight);
      if (widget.onCloseCallBack != null) widget.onCloseCallBack!();
    });
  }

  void show() {
    if (height != widget.lineHeight) return;
    _animationController.reverse().whenComplete(() {
      if (mounted) setState(() => bottomPadding = 0);
      if (widget.onShowCallBack != null) widget.onShowCallBack!();
    });
  }

  Widget tabItem(int index, {AlignmentGeometry? alignment = Alignment.center}) {
    bool isLocked = true;
    if (widget.tabLocked == null || !widget.tabLocked![index]) isLocked = false;

    if (isLocked) {
      return Container(
        height: height,
        width: widget.tabWidth,
        child: Row(
          children: [
            Text(
              widget.tabs[index],
            ),
            LockIcon(),
          ],
        ),
      );
    }

    return Container(
      height: height,
      width: widget.tabWidth,
      alignment: alignment,
      child: Text(
        widget.tabs[index],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      child: Stack(
        children: [
          Container(
            height: height,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: widget.elevation == 0
                      ? Colors.transparent
                      : Pigment.fromString("#eee"),
                ),
              ),
            ),
          ),
          Container(
            height: height,
            width: double.maxFinite,
            padding: widget.tabBarPadding == null
                ? EdgeInsets.only(bottom: bottomPadding)
                : EdgeInsets.only(
                    top: widget.tabBarPadding?.top ?? 0,
                    right: widget.tabBarPadding?.right ?? 0,
                    bottom: widget.tabBarPadding?.bottom ?? 0 + bottomPadding,
                    left: widget.tabBarPadding?.left ?? 0,
                  ),
            child: TabBar(
              onTap: widget.onTap,
              controller: widget.controller,
              isScrollable: widget.isScrollable ?? true,
              labelColor: highlightColor,
              unselectedLabelColor: hintColor,
              indicatorColor: highlightColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: widget.indicatorDecoration ??
                  ACETabBarIndicator(
                    type: ACETabBarIndicatorType.underline,
                    lineWidth: 14.w,
                    height: 4.h,
                  ),
              labelStyle: widget.labelStyle ??
                  TextStyle(
                    fontSize: 14.sp,
                    fontFamily: notoSansSC,
                    fontWeight: FontWeight.w500,
                  ),
              unselectedLabelStyle: widget.labelStyle ??
                  widget.unselectedLabelStyle ??
                  TextStyle(
                    fontSize: 14.sp,
                    fontFamily: notoSansSC,
                    fontWeight: FontWeight.w500,
                  ),
              tabs: widget.tabs
                  .map(
                    (item) => tabItem(
                      widget.tabs.indexOf(item),
                      alignment:
                          widget.alignments?[widget.tabs.indexOf(item)] ??
                              Alignment.center,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
