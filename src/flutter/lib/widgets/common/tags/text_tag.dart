import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart';
import 'package:rime_app/models/action/action.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/action.dart';

class TextTag extends StatelessWidget {
  const TextTag({Key? key, required this.textTag}) : super(key: key);

  final GTextTagFields textTag;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.primaryColor.withOpacity(0.12),
      borderRadius: BorderRadius.circular(2.h),
      child: InkWell(
        onTap: textTag.action != null
            ? () {
                String? type = textTag.action?.type.toString();
                Map<String, dynamic>? args = textTag.action?.args;
                if (type != null && args != null) {
                  FluroUtil.navigatorByAction(context,
                      tapAction: new ActionModel(type, args));
                }
              }
            : null,
        child: Container(
          // height: height ?? 25,
          constraints: BoxConstraints(maxWidth: 0.7.sw),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Text(
            textTag.name ?? "",
            style: (bodyText2.copyWith(color: theme.primaryColor)),
          ),
        ),
      ),
    );
  }
}
