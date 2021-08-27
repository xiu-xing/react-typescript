import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/entity_chip.dart';

class InfoFlowItem extends StatelessWidget {
  const InfoFlowItem({
    Key? key,
    this.onTap,
    this.outPadding,
    this.title,
    this.content,
    this.publishTime,
    this.relatedEntity,
    this.shareable = true,
    this.source,
  }) : super(key: key);

  final void Function()? onTap;
  final EdgeInsets? outPadding;
  final String? title;
  final String? content;
  final String? publishTime;
  final List<GEntityFields>? relatedEntity;
  final bool shareable;
  final String? source;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: outPadding ??
            EdgeInsets.only(left: 24.w, top: 14.h, right: 24.w, bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (title != null)
              Text(
                title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: headline2.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (content != null) SizedBox(height: 4.h),
            Text(
              content!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: bodyText1.copyWith(
                color: Pigment.fromString("#666"),
              ),
            ),
            if (relatedEntity != null && relatedEntity!.isNotEmpty)
              SizedBox(height: 8.h),
            if (relatedEntity != null && relatedEntity!.isNotEmpty)
              Wrap(
                direction: Axis.horizontal,
                spacing: 10.w,
                runSpacing: 2.h,
                children: relatedEntity!
                    .map((e) => EntityChip(relatedEntity: e))
                    .toList(),
              ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 8.w,
                  children: [
                    if (publishTime != null)
                      Text(
                        Jiffy(DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(publishTime!))
                                .toString())
                            .fromNow(),
                        style: subtitle2,
                      ),
                    if (source != null)
                      Text(
                        source!,
                        style: subtitle2,
                      ),
                  ],
                ),
                if (shareable)
                  InkWell(
                    onTap: () {
                      String t = Uri.encodeComponent(title ?? "");
                      String c = Uri.encodeComponent(content ?? "");
                      String p = publishTime != null
                          ? Uri.encodeComponent(Jiffy(
                                  DateTime.fromMillisecondsSinceEpoch(
                                          int.parse(publishTime!))
                                      .toString())
                              .fromNow())
                          : "";
                      router.navigateTo(
                        context,
                        "${Routes.share}?title=$t&content=$c&publishTime=$p",
                      );
                    },
                    borderRadius: BorderRadius.circular(2.h),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_share.svg',
                            color: primaryColor,
                            height: 20.w,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "分享",
                            style: bodyText2.copyWith(color: hintColor),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
