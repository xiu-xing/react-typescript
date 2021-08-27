import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferredSizeBar extends StatefulWidget implements PreferredSizeWidget {
  PreferredSizeBar({
    Key? key,
    this.height = 40,
    required this.child,
    this.overlayStyle = SystemUiOverlayStyle.light,
    this.backgroundColor = Colors.white,
    this.elevation = 0.0,
  })  : preferredSize = Size.fromHeight(height.h),
        super(key: key);

  final double height;
  final Widget child;
  final SystemUiOverlayStyle overlayStyle;
  final Color backgroundColor;
  final double elevation;

  @override
  final Size preferredSize;

  @override
  _PreferredSizeBarState createState() => _PreferredSizeBarState();
}

class _PreferredSizeBarState extends State<PreferredSizeBar> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    Widget appBar = Container(
      margin: EdgeInsets.only(top: 24.h),
      child: widget.child,
    );

    appBar = Align(
      alignment: Alignment.center,
      child: appBar,
    );

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: widget.overlayStyle,
        child: Material(
          color: widget.backgroundColor,
          elevation: widget.elevation,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}
