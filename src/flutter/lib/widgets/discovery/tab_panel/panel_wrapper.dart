import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/list_widget/list_widget_next.dart';

class PanelWrapper extends StatelessWidget {
  PanelWrapper({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onRefresh,
    this.onLoadMore,
    this.tapViewMoreCallback,
    this.canLoad = false,
    this.controller,
  }) : super(key: key);

  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoadMore;
  final void Function()? tapViewMoreCallback;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool canLoad;
  final EasyRefreshController? controller;

  Widget bottom() {
    return GestureDetector(
      onTap: tapViewMoreCallback,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "查看更多",
              style: bodyText1.copyWith(
                color: Pigment.fromString("#999"),
                height: 1.12,
              ),
            ),
            Icon(
              MdiIcons.chevronRight,
              size: 16.sp,
              color: Pigment.fromString("#999"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListWidgetNext(
      controller: controller,
      itemCount: itemCount,
      onRefreshCallback: onRefresh,
      onLoadCallback: onLoadMore,
      canLoad: canLoad,
      firstRefresh: false,
      itemBuilder: (context, index) {
        // if (index == itemCount) return bottom();
        return itemBuilder(context, index);
      },
    );
  }
}
