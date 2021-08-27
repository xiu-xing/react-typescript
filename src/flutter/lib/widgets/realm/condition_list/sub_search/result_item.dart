import 'package:flutter/material.dart';
import 'package:rime_app/graphql/queries/realm_suggestions/realm_suggestions.data.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/utils/highlight_span.dart';

class SubSearchResultItem extends StatelessWidget {
  const SubSearchResultItem({
    Key? key,
    required this.node,
    required this.selected,
    this.onTap,
    required this.keyword,
  }) : super(key: key);

  final GRealmSuggestionsData_appRealmSuggestions_nodes node;
  final bool selected;
  final void Function()? onTap;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 32.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text.rich(
                TextSpan(
                    children: splitTextSpan(node.primaryName, [keyword],
                        normalStyle: subtitle1,
                        highlightStyle:
                            subtitle1.copyWith(color: primaryColor))),
                maxLines: 2,
              ),
            ),
            Spacer(),
            Visibility(
              visible: selected,
              child: Icon(
                Icons.check,
                size: 20.w,
                color: primaryColor,
              ),
            ),
            SizedBox(
              width: 24.w,
            )
          ],
        ),
      ),
    );
  }
}
