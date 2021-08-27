import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart';

class RiskTag extends StatelessWidget {
  const RiskTag({Key? key, required this.riskTag}) : super(key: key);

  final GRiskTagFields riskTag;

  List<Widget> iconListWidget() {
    List<Widget> list = [];
    for (var i = 0; i < (riskTag.level ?? 0); i++) {
      list.add(Container(
        padding: EdgeInsets.all(2.w),
        child: Icon(
          MdiIcons.alertCircle,
          color: Pigment.fromString("#F56161"),
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
          color: Pigment.fromString("#F56161").withOpacity(0.2),
          borderRadius: BorderRadius.circular(2.h)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconListWidget(),
      ),
    );
  }
}
