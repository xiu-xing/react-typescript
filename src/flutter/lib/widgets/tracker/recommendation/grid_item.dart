import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/network_image.dart';

//
class TrackerGridItem extends StatefulWidget {
  const TrackerGridItem({
    Key? key,
    required this.selectChange,
    required this.entity,
  }) : super(key: key);
  final ValueChanged<bool> selectChange;
  final GTrackerRecommendationsData_appTrackerRecommendations entity;

  @override
  _TrackerGridItemState createState() => _TrackerGridItemState();
}

class _TrackerGridItemState extends State<TrackerGridItem>
    with AutomaticKeepAliveClientMixin {
  bool isSelect = false;

  void onTap() {
    setState(() => isSelect = !isSelect);
    widget.selectChange(isSelect);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      borderRadius: BorderRadius.circular(4.w),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Pigment.fromString("EEE"),
          ),
          borderRadius: BorderRadius.circular(4.w),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NetWorkImage(image: widget.entity.logoURI),
                  Text(
                    widget.entity.primaryName,
                    style: bodyText1,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              top: 10.w,
              child: Icon(
                MdiIcons.checkboxBlankCircleOutline,
                size: 16,
                color: Pigment.fromString("#999"),
              ),
            ),
            Positioned(
              right: 10.w,
              top: 10.w,
              child: AnimatedOpacity(
                opacity: isSelect ? 1 : 0,
                curve: Curves.linear,
                duration: Duration(milliseconds: 200),
                child: Icon(
                  MdiIcons.checkCircle,
                  size: 16,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
