import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/widgets/common/network_image.dart';

class EntityChip extends StatelessWidget {
  const EntityChip({Key? key, required this.relatedEntity}) : super(key: key);
  final GEntityFields relatedEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        router.navigateTo(context,
            "${Routes.profile}?id=${relatedEntity.entityId}&type=${relatedEntity.entityType}");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NetWorkImage(
              image: relatedEntity.portraitURL ?? "",
              size: 24.sp,
              margin: EdgeInsets.only(right: 4.w),
            ),
            Text(
              relatedEntity.entityName,
              style: bodyText2.copyWith(color: Pigment.fromString('#666666')),
            ),
          ],
        ),
      ),
    );
  }
}
