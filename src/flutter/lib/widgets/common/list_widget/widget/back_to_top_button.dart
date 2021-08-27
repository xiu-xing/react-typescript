import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackToTopButton extends StatefulWidget {
  final void Function()? onPressed;
  final String? tag;
  BackToTopButton({Key? key, this.onPressed, this.tag}) : super(key: key);
  @override
  BackToTopButtonState createState() => BackToTopButtonState();
}

class BackToTopButtonState extends State<BackToTopButton> {
  double opacityLevel = 0.0;
  void show() {
    if (opacityLevel != 1.0) setState(() => opacityLevel = 1.0);
  }

  void close() {
    if (opacityLevel != 0.0) setState(() => opacityLevel = 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: new Duration(milliseconds: 100),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 40.w,
          width: 40.w,
          margin: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20.w),
              boxShadow: [
                BoxShadow(
                  color: Color(0x668c9d7a),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              radius: 20.w,
              borderRadius: BorderRadius.circular(20.w),
              onTap: widget.onPressed,
              child: Container(
                child: Icon(
                  MdiIcons.chevronUp,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ),
        // child: FloatingActionButton(
        //   // heroTag: widget.tag,
        //   heroTag: null,
        //   onPressed: widget.onPressed ?? null,
        //   child: Icon(MdiIcons.chevronUp),
        //   backgroundColor: highlightColor,
        // ),
      ),
    );
  }
}
