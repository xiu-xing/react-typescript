import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/theme.dart';

class CommonAppbar extends StatefulWidget implements PreferredSizeWidget {
  CommonAppbar({
    Key? key,
    this.darkTheme = false,
    this.title,
    this.customizable = false,
    this.bottom,
    this.elevation,
    this.defaultActionsHandle,
    this.actions,
    this.leading,
    this.titleCenter,
  })  : preferredSize =
            Size.fromHeight(40.h + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  final bool darkTheme;
  final Widget? title;
  final bool customizable;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final bool? titleCenter;

  // final IconData defaultActions;
  final Function? defaultActionsHandle;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  final Size preferredSize;

  @override
  _CommonAppbarState createState() => _CommonAppbarState();
}

class _CommonAppbarState extends State<CommonAppbar> {
  static const double _defaultElevation = 1.0;

  Widget customizedAppBar() {
    Widget leading = widget.leading ??
        IconButton(
          splashRadius: 20.w,
          icon: Icon(
            Icons.chevron_left,
            size: 24.w,
            color: regularColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          // margin: EdgeInsets.only(left: 8.w),
        );

    Widget title = Expanded(
      child: widget.titleCenter == true
          ? Center(
              child: widget.title,
            )
          : widget.title ?? Container(),
    );

    Widget actions = Container();

    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.actions ?? [],
      );
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[leading, title, actions, SizedBox(width: 8.w)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    Widget appBar = Container(
      margin: EdgeInsets.only(top: 24.h),
      child: customizedAppBar(),
    );

    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 24.h),
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxHeight: 46.h),
              child: customizedAppBar(),
            ),
          ),
          if (widget.bottom != null) widget.bottom!,
        ],
      );
    }
    appBar = Align(
      alignment: Alignment.center,
      child: appBar,
    );
    final SystemUiOverlayStyle overlayStyle = widget.darkTheme
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: widget.darkTheme ? theme.primaryColor : Colors.white,
          elevation: widget.elevation ?? _defaultElevation,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}
