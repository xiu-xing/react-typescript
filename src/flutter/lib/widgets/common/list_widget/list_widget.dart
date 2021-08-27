import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/blur_rect_widget.dart';
import 'package:rime_app/widgets/common/circular_progress/circular_progress.dart';
import 'package:rime_app/widgets/common/empty/empty.dart';
import 'package:rime_app/widgets/common/list_widget/widget/back_to_top_button.dart';
import 'package:rime_app/widgets/common/list_widget/widget/common_foot_widget.dart';

@Deprecated(
  'Use ListWidgetNext instead.'
  'This widget will deprecated at next version',
)
class ListWidget extends StatefulWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget? listHeader;
  final Widget? customBlurWidget;
  final int itemCount;
  final EdgeInsets? dividerMargin;
  final ScrollController? controller;
  final bool showDivider;
  final bool hasNextPage;
  final bool onLoading;
  final ScrollPhysics? physics;
  final void Function()? loadMoreCallback;
  final void Function()? scrollToTopCallBack;
  final Future<void> Function()? refreshCallback;
  final bool loadDone;
  final String? backToTopButtonTag;
  final bool needACWidget;
  final double? blurHeight;
  final int blurThreshold;
  ListWidget({
    Key? key,
    required this.itemBuilder,
    this.listHeader,
    this.customBlurWidget,
    required this.itemCount,
    this.dividerMargin,
    this.controller,
    this.showDivider = true,
    this.hasNextPage = false,
    this.onLoading = false,
    this.physics,
    this.loadMoreCallback,
    this.refreshCallback,
    this.scrollToTopCallBack,
    this.loadDone = true,
    this.backToTopButtonTag,
    this.needACWidget = false,
    this.blurHeight,
    this.blurThreshold = 3,
  }) : super(key: key);
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  GlobalKey<BackToTopButtonState> _backToTopButtonKey = new GlobalKey();
  ScrollController _scrollController = new ScrollController();

  bool isActivity() {
    return false;
    //   return (Global.userProvider.role == GRole.ACTIVE ||
    //       Global.userProvider.role == GRole.TRIAL);
  }

  Widget listWidgetContent(int index) {
    if (isActivity() || !widget.needACWidget || index < widget.blurThreshold) {
      if (widget.itemCount == 0)
        return Container(
            constraints: BoxConstraints(maxHeight: 0.7.sh), child: Empty());
      if (widget.hasNextPage) {
        return Container();
      } else {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Text(
              "没有更多数据",
              style: TextStyle(
                  fontFamily: notoSansSC,
                  color: Pigment.fromString("#999"),
                  fontSize: 12.sp),
            ),
          ),
        );
      }
    } else if (!widget.hasNextPage) {
      return widget.customBlurWidget ??
          Stack(
            children: [
              widget.itemBuilder(context, 0),
              BlurRectWidget(
                height: widget.blurHeight ?? 100.h,
                child: Center(
                  child: Container(),
                ),
              )
            ],
          );
    }
    return Container();
  }

  @override
  initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 250 &&
          widget.backToTopButtonTag != null) {
        _backToTopButtonKey.currentState!.show();
      }

      if (_scrollController.position.pixels < 250 &&
          widget.backToTopButtonTag != null) {
        _backToTopButtonKey.currentState!.close();
      }

      if (_scrollController.position.pixels == 0) {
        if (widget.scrollToTopCallBack != null) {
          widget.scrollToTopCallBack!();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int listViewLen =
        widget.listHeader == null ? widget.itemCount + 1 : widget.itemCount + 2;

    Widget listView = ListView.separated(
      controller: widget.controller ?? _scrollController,
      itemCount: listViewLen,
      itemBuilder: (context, index) {
        /// list view 头部
        if (widget.listHeader != null && index == 0)
          return widget.listHeader ?? Container();

        /// list view 最后一个
        if (index == listViewLen - 1) {
          return listWidgetContent(index);
        }

        int itemIndex = index - (widget.listHeader == null ? 0 : 1);
        return widget.itemBuilder(context, itemIndex);
      },
      separatorBuilder: (context, index) {
        if (index == listViewLen || (widget.listHeader != null && index == 0))
          return Container();
        return widget.showDivider
            ? Container(
                margin: widget.dividerMargin ?? EdgeInsets.zero,
                child: Divider(
                  height: 1,
                  color: Pigment.fromString("#EEEEEE"),
                ),
              )
            : Container();
      },
    );

    if (widget.itemCount == 0 && !widget.loadDone)
      return CircularProgress(size: 35.w);

    return Stack(
      children: [
        EasyRefresh(
          emptyWidget: (widget.itemCount == 0 &&
                  widget.listHeader == null &&
                  widget.loadDone)
              ? Empty(reload: widget.refreshCallback)
              : null,
          onRefresh: widget.refreshCallback,
          onLoad: widget.hasNextPage
              ? () async {
                  if (widget.loadMoreCallback != null)
                    widget.loadMoreCallback!();
                }
              : null,
          child: listView,
          header: MaterialHeader(),
          footer: CommonFooter(
            hasNextPage: widget.hasNextPage,
            loadDone: widget.loadDone,
            enableInfiniteLoad: true,
          ),
        ),
        widget.backToTopButtonTag != null
            ? BackToTopButton(
                key: _backToTopButtonKey,
                tag: widget.backToTopButtonTag,
                onPressed: () {
                  _scrollController.animateTo(0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                })
            : Container()
      ],
    );
  }
}
