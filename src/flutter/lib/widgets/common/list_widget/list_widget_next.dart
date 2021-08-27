import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/access_control/permission.dart';
import 'package:rime_app/widgets/common/empty/empty.dart';
import 'package:rime_app/widgets/common/list_widget/widget/footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/loading/loading.dart';

/// tips
/// 当使用 firstRefresh 时，组件第一次加载会调用 onRefreshCallback 内方法，请避免重复刷新数据。
/// 如果 controller 不为空，refresh 状态推荐使用 controller.finishRefresh(success: bool);
class ListWidgetNext extends StatefulWidget {
  const ListWidgetNext({
    Key? key,
    this.onRefreshCallback,
    this.canLoad = false,
    this.onLoadCallback,
    this.itemCount,
    this.itemBuilder,
    this.customizedChild,
    this.footer,
    this.header,
    this.locked = false,
    this.firstRefresh = true,
    this.controller,
  })  : assert(customizedChild != null ||
            (itemCount != null && itemBuilder != null)),
        super(key: key);

  /// 刷新回调(null为不开启刷新)
  final Future<void> Function()? onRefreshCallback;

  /// 加载回调(null或者 canLoad = false 时不开启刷新)
  final Future<void> Function()? onLoadCallback;
  // final Future<void> Function(EasyRefreshController controller)? onLoadCallback;

  /// 是否开启加载功能，默认不开启
  final bool canLoad;

  /// list 长度
  final int? itemCount;

  /// list 单个组件样式
  final Widget Function(BuildContext, int)? itemBuilder;

  /// 如果不想使用默认的 listview 可自定义 child
  final Widget? customizedChild;

  /// 如果不想使用默认的底部控件 可自定义 child
  final Footer? footer;

  /// 如果不想使用默认的下拉刷新控件 可自定义 child
  final Header? header;

  /// 是否给列表添加权限 默认为 false
  final bool locked;

  /// 是否需要首次加载的 loading 默认有 loading 当为 true 时会在组件加载时调用一次 onRefreshCallback
  final bool firstRefresh;

  /// use when u need it
  final EasyRefreshController? controller;

  @override
  _ListWidgetNextState createState() => _ListWidgetNextState();
}

class _ListWidgetNextState extends State<ListWidgetNext> {
  Widget bottom() {
    if (!widget.canLoad && widget.itemCount! > 0) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Center(
          child: Text("滑到底啦", style: subtitle2),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EasyRefresh(
          enableControlFinishRefresh: widget.controller != null,
          enableControlFinishLoad: widget.controller != null,
          controller: widget.controller,
          firstRefresh: widget.firstRefresh,
          firstRefreshWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Loading(scale: .4),
              SizedBox(height: 128.h, width: 72.w)
            ],
          ),
          emptyWidget: widget.itemCount == 0 ? Empty() : null,
          onRefresh: widget.onRefreshCallback,
          onLoad: widget.canLoad ? widget.onLoadCallback : null,
          child: widget.customizedChild ??
              ListView.builder(
                itemCount: widget.itemCount! + 1,
                itemBuilder: (context, index) {
                  if (index == widget.itemCount) {
                    return bottom();
                  }
                  return widget.itemBuilder!(context, index);
                },
              ),
          header: widget.header ?? MaterialHeader(),
          footer: widget.footer ??
              ListFooter(
                canLoad: widget.canLoad,
                reloadFunc: widget.onLoadCallback,
              ),
        ),
        if (widget.locked)
          Container(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: Container(
                  color: Colors.white.withOpacity(0.77),
                  child: Center(
                    child: Permission(),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
