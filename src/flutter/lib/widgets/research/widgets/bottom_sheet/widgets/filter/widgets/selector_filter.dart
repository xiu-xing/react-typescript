import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/graphql/queries/research/research.data.gql.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';

class SelectorFilter extends StatefulWidget {
  final GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter
      filter;
  final GSelectorFilterInput? value;
  final ValueChanged<GSelectorFilterInput>? onChange;
  SelectorFilter({Key? key, required this.filter, this.value, this.onChange})
      : super(key: key);

  @override
  _SelectorFilterState createState() => _SelectorFilterState();
}

class _SelectorFilterState extends State<SelectorFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.filter.name ?? "",
            style: bodyText1.copyWith(color: grey66),
          ),
          SizedBox(
            height: 16,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 102.w / 32.w,
            children: widget.filter.options!
                .map(
                  (o) => Material(
                    color: widget.value?.filterValue == o.value
                        ? primaryColor
                        : Pigment.fromString("#F8F8F8"),
                    borderRadius: BorderRadius.circular(4.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4.0),
                      onTap: () {
                        if (widget.onChange != null) {
                          widget.onChange!(
                            (widget.value ?? GSelectorFilterInput()).rebuild(
                              (b) => b
                                ..filterID = widget.filter.id
                                ..filterValue = o.value
                                ..displayValue = o.key
                                ..name = widget.filter.name
                                ..operator = widget.filter.operator,
                            ),
                          );
                        }
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            o.key,
                            style: subtitle2.copyWith(
                              color: widget.value?.filterValue == o.value
                                  ? Colors.white
                                  : grey66,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
