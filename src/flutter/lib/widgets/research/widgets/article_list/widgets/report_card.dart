import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/research/provider.dart';

class ReportCard extends StatelessWidget {
  final String? data;
  const ReportCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) return Container();
    var mapData = jsonDecode(data!);

    String reportId = mapData["id"];
    var companyName = mapData["publish_company_name"];

    return GestureDetector(
      onTap: () {
        router.navigateTo(context,
            '${Routes.researchProfile}?id=$reportId&articleModuleId=${context.read<ResearchProvider>().activedModuleId}');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mapData["title"] ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: regularColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: notoSansSC,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              (mapData["description"] ?? ""),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: hintColor,
                fontSize: 14.sp,
                fontFamily: notoSansSC,
              ),
              locale: Locale.fromSubtags(languageCode: "zh"),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  mapData["publish_date"] ?? "",
                  style: TextStyle(
                    color: grey99,
                    fontSize: 12.sp,
                    fontFamily: notoSansSC,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  companyName ?? "",
                  style: TextStyle(
                    color: grey99,
                    fontSize: 12.sp,
                    fontFamily: notoSansSC,
                  ),
                ),
                // SizedBox(
                //   width: 12,
                // ),
                // Text(
                //   "智能硬件",
                //   style: TextStyle(
                //     color: grey99,
                //     fontSize: 12.sp,
                //     fontFamily: notoSansSC,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
