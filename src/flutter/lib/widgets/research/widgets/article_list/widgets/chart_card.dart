import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/research_photo_viewer/research_photo_viewer.dart';

import '../../../provider.dart';

class ChartCard extends StatelessWidget {
  final String? data;
  const ChartCard({Key? key, this.data}) : super(key: key);

  // print(data);

  @override
  Widget build(BuildContext context) {
    if (data == null) return Container();

    Map<String, dynamic> mapData = jsonDecode(data!);

    String reportId = mapData["report_id"];
    String imageUri = "$STORAGE_ENDPOINT${mapData["chart_uri"]}";

    return Consumer<ResearchProvider>(builder: (ctx, p, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mapData["chart_name"],
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
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ResearchPhotoViewer(
                      reportId: reportId,
                      articleModuleId: p.activedModuleId,
                      url: imageUri,
                      token: p.token,
                    ),
                  ),
                );
              },
              child: AspectRatio(
                aspectRatio: 327 / 140,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: mapData["chart_uri"],
                    child: NetWorkImage(
                      placeholder: Container(),
                      httpHeaders: {"Cookie": "access_token=${p.token}"},
                      image: imageUri,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  mapData["publish_date"],
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
                //   "国信证券",
                //   style: TextStyle(
                //     color: grey99,
                //     fontSize: 12.sp,
                //     fontFamily: notoSansSC,
                //   ),
                // ),
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
      );
    });
  }
}
