import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/queries/team/team.data.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/network_image.dart';

class BindingEntity extends StatelessWidget {
  const BindingEntity(
    this.team, {
    Key? key,
  }) : super(key: key);

  final GTeamsData_teams? team;

  @override
  Widget build(BuildContext context) {
    return team == null
        ? Container()
        : Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Text(
                      "我的机构",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: notoSansSC,
                        color: Pigment.fromString("#666"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NetWorkImage(
                        image: team?.portraitUri ?? "",
                        margin: EdgeInsets.only(right: 8.w),
                      ),
                      Expanded(
                        child: Text(
                          team?.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: notoSansSC,
                              fontSize: 16.sp,
                              height: 1.15),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
