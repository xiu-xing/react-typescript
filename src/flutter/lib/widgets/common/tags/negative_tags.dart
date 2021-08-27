import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NegativeTags extends StatelessWidget {
  final int? level;
  NegativeTags({Key? key, this.level}) : super(key: key);

  List<Widget> tagList() {
    List<Widget> list = [];
    for (var i = 0; i < (level ?? 0); i++) {
      list.add(Container(
        padding: EdgeInsets.all(2.w),
        child: Icon(
          MdiIcons.alertCircle,
          color: deleteColor,
          size: 14.w,
        ),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: deleteColorWithOpactity,
          borderRadius: BorderRadius.circular(2.h)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: tagList(),
      ),
    );
  }
}
