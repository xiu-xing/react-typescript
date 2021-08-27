import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/circular_progress/circular_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonFooter extends Footer {
  final Key? key;
  final bool hasNextPage;
  final bool loadDone;
  final Widget? child;
  final double? height;
  final bool enableInfiniteLoad;

  final LinkFooterNotifier linkNotifier = LinkFooterNotifier();

  CommonFooter({
    this.key,
    this.height,
    this.hasNextPage = false,
    this.loadDone = true,
    this.child,
    completeDuration = const Duration(seconds: 1),
    bool enableHapticFeedback = false,
    this.enableInfiniteLoad = false,
    bool overScroll = false,
  }) : super(
          float: true,
          extent: height ?? 50.h,
          triggerDistance: height ?? 50.h,
          completeDuration: completeDuration == null
              ? Duration(
                  milliseconds: 300,
                )
              : completeDuration +
                  Duration(
                    milliseconds: 300,
                  ),
          enableHapticFeedback: enableHapticFeedback,
          enableInfiniteLoad: enableInfiniteLoad,
          overScroll: overScroll,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      LoadMode loadState,
      double pulledExtent,
      double loadTriggerPullDistance,
      double loadIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration? completeDuration,
      bool enableInfiniteLoad,
      bool success,
      bool noMore) {
    linkNotifier.contentBuilder(
        context,
        loadState,
        pulledExtent,
        loadTriggerPullDistance,
        loadIndicatorExtent,
        axisDirection,
        float,
        completeDuration,
        enableInfiniteLoad,
        success,
        noMore);
    return CommonFooterWidget(
      key: key,
      hasNextPage: hasNextPage,
      loadDone: loadDone,
      child: child,
    );
  }
}

/// 质感设计Footer组件
class CommonFooterWidget extends StatefulWidget {
  final bool hasNextPage;
  final bool loadDone;
  final Widget? child;

  const CommonFooterWidget({
    Key? key,
    this.hasNextPage = false,
    this.loadDone = true,
    this.child,
  }) : super(key: key);

  @override
  CommonFooterWidgetState createState() {
    return CommonFooterWidgetState();
  }
}

class CommonFooterWidgetState extends State<CommonFooterWidget> {
  Widget commontWidget() {
    return widget.hasNextPage
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgress(
                size: 10.w,
                strokeWidth: 1.6,
              ),
              Text(
                '加载中...',
                style: bodyText2.copyWith(
                  color: disabledColor,
                ),
              )
            ],
          )
        : Text(
            "暂无更多",
            style: subtitle2.copyWith(color: grey99),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child ?? commontWidget());
  }
}
