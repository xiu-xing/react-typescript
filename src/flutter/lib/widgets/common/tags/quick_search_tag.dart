import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/graphql/types/tags/tags_fragment.data.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/highlight_span.dart';
import 'package:rime_app/widgets/common/network_image.dart';

class QuickSearchTag extends StatelessWidget {
  const QuickSearchTag({
    Key? key,
    required this.quickSearchTag,
    this.keywordList,
    this.maxWidth,
  }) : super(key: key);

  final GQuickSearchTagFields quickSearchTag;
  final List<String>? keywordList;
  final double? maxWidth;

  Widget textWidget() {
    if (keywordList == null) {
      return Text(
        "${quickSearchTag.nameType}: ${quickSearchTag.matchedName}",
        style: bodyText2.copyWith(color: Pigment.fromString("#666666")),
      );
    }
    return RichText(
      text: TextSpan(
        children: splitTextSpan(
          "${quickSearchTag.nameType}: ${quickSearchTag.matchedName}",
          keywordList!,
          normalStyle: bodyText2.copyWith(color: Pigment.fromString("#666666")),
          highlightStyle: bodyText2.copyWith(
            color: theme.primaryColor,
          ),
        ),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        NetWorkImage(
          image: quickSearchTag.icon ?? "",
          size: 16.w,
          backgroundColor: Colors.transparent,
          border: Border.all(color: Colors.transparent),
        ),
        SizedBox(width: 2.w),
        ConstrainedBox(
          child: textWidget(),
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? MediaQuery.of(context).size.width * 0.7,
          ),
        )
      ],
    );
  }
}
