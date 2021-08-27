// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:rime_app/common/global.dart';
// import 'package:rime_app/common/user_provider.dart';
// import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
// import 'package:rime_app/models/route/routes.dart';
// import 'package:rime_app/router.dart';
// import 'package:rime_app/theme.dart';
// import 'package:rime_app/widgets/common/access_control/dialog.dart';
// import 'package:rime_app/widgets/common/flat_text_button/flat_text_button.dart';

class BlurRectWidget extends StatelessWidget {
  final Widget? child;
  final double? height;
  final GlobalKey? globalKey;

  BlurRectWidget({this.child, this.height, this.globalKey});

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: ClipRRect(
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(
        //       sigmaX: 4,
        //       sigmaY: 4,
        //     ),
        //     child: Container(
        //       color: Colors.white.withOpacity(0.8),
        //       height: height,
        //       width: double.maxFinite,
        //       child: Center(
        //         child: Selector<UserProvider, GRole>(
        //           selector: (_, provider) => provider.role,
        //           builder: (context, role, _) {
        //             return Container(
        //               padding:
        //                   EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.h),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     role == GRole.PUBLIC
        //                         ? "认证机构 查看全量数据"
        //                         : "购买正式账号 体验高级功能",
        //                     style:
        //                         headline1.copyWith(fontWeight: FontWeight.w500),
        //                   ),
        //                   SizedBox(
        //                     height: 10.h,
        //                   ),
        //                   FlatTextButton(
        //                     width: 100.w,
        //                     height: 40.h,
        //                     text: role == GRole.PUBLIC ? '立即认证' : '立即购买',
        //                     textStyle: headline2.copyWith(
        //                       height: 1.15,
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.w500,
        //                     ),
        //                     borderRadius: 20.h,
        //                     backgroundColor: highlightColor,
        //                     onTap: () {
        //                       if (role == GRole.PUBLIC) {
        //                         router.navigateTo(context,
        //                             "${Routes.verfication}?status=${Global.userProvider.ticketStatus}");
        //                       } else {
        //                         showAccessControlDialog(context);
        //                       }
        //                     },
        //                   ),
        //                 ],
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
