import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/graphql/queries/research/research.data.gql.dart';
import 'package:rime_app/widgets/research/provider.dart';
import 'package:rime_app/widgets/research/widgets/bottom_sheet/widgets/filter/widgets/muti_selector_filter.dart';

import 'widgets/selector_filter.dart';

class Filter extends StatelessWidget {
  final GArticleTabsData_appArticleTabs__asArticleTab_filters filter;

  const Filter({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (this.filter.G__typename) {
      case "SelectorFilter":
        {
          var buffered = context.watch<ResearchProvider>().bufferedFilterInputs;

          if (buffered == null) return Container();

          var filter = this.filter
              as GArticleTabsData_appArticleTabs__asArticleTab_filters__asSelectorFilter;

          if (filter.multiple == true) {
            int? index = buffered.multiSelectorFilterInputs
                ?.indexWhere((f) => f.filterID == filter.id);

            var value = buffered.multiSelectorFilterInputs?[index!];

            return MutilSelectorFilter(
              filter: filter,
              value: value,
              onChange: (value) {
                context
                    .read<ResearchProvider>()
                    .updateMutilSelectorFilterValue(value);
              },
            );
          } else {
            var value = buffered.selectorFilterInputs?[buffered
                    .selectorFilterInputs
                    ?.indexWhere((f) => f.filterID == filter.id) ??
                0];
            return SelectorFilter(
              filter: filter,
              onChange: (value) {
                context
                    .read<ResearchProvider>()
                    .updateSelectorFilterValue(value);
              },
              value: value,
            );
          }
        }
      default:
        return Container();
    }
  }
}
