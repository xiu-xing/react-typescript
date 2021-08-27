import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/icon_button.dart';
import 'package:rime_app/widgets/tracker/bottom_sheet.dart';
import 'package:rime_app/widgets/tracker/provider.dart';
import 'package:rime_app/widgets/common/pop_up_menu/customize_bottom_sheet.dart'
    as bs;

class TrackerTagsConditions extends StatefulWidget {
  const TrackerTagsConditions({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final GTrackerTheme theme;
  @override
  _TrackerTagsConditionsState createState() => _TrackerTagsConditionsState();
}

class _TrackerTagsConditionsState extends State<TrackerTagsConditions> {
  // bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<TrackerProvider>(
      builder: (c, p, _) {
        return CommonIconButton(
          size: 40.w,
          margin: EdgeInsets.only(right: 16.w),
          icon: Icon(
            MdiIcons.tune,
            size: 22.w,
            color: p.selectTag.isNotEmpty
                ? theme.primaryColor
                : Pigment.fromString("#666"),
          ),
          onTap: () {
            bs.showModalBottomSheet(
              context: context,
              builder: (_) => TrackerBottomSheetWidget(
                preset: p.selectTag,
                trackerTheme: widget.theme,
                onConfirm: (value) {
                  // setState(() => selected = value == "");
                  p.setSelectTag(value);
                },
              ),
            );
          },
        );
      },
    );
  }
}
