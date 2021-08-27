import 'package:flutter/material.dart' hide BottomSheet;
import 'package:provider/provider.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/widgets/research/provider.dart';
import './bottom_sheet/bottom_sheet.dart';
import '../../../theme.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _getHasActivitedFilter(GFilterInputs? value) {
      if (value == null) return false;

      if (value.selectorFilterInputs?.isNotEmpty == true &&
          value.selectorFilterInputs!.every((f) => f.filterValue != ""))
        return true;

      if (value.multiSelectorFilterInputs?.isNotEmpty == true &&
          value.multiSelectorFilterInputs!
                  .indexWhere((f) => f.filterValues.isNotEmpty) !=
              -1) return true;

      return false;
    }

    return Consumer<ResearchProvider>(builder: (ctx, p, _) {
      return IconButton(
        splashRadius: 20,
        iconSize: 20,
        onPressed: p.filters == null
            ? null
            : () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: p,
                    child: BottomSheet(),
                  );
                }),
        color: _getHasActivitedFilter(p.bufferedFilterInputs)
            ? primaryColor
            : grey66,
        icon: Icon(Icons.tune),
      );
    });
  }
}
