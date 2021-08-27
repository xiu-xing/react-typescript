import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/widgets/common/chip/chip.dart';

class ChipGridView extends StatefulWidget {
  const ChipGridView({
    Key? key,
    required this.list,
    required this.onValueChange,
    this.isMultiple = false,
  }) : super(key: key);

  final List<GUserProfileData_userProfile_fields_options> list;
  final bool isMultiple;
  final ValueChanged<List<GUserProfileFieldOptionInput>> onValueChange;
  @override
  _ChipGridViewState createState() => _ChipGridViewState();
}

class _ChipGridViewState extends State<ChipGridView> {
  List<GUserProfileFieldOptionInput> mulSelected = [];
  GUserProfileFieldOptionInput? selected;

  bool checkIsSelected(GUserProfileData_userProfile_fields_options v) {
    if (widget.isMultiple) {
      return mulSelected.indexWhere((e) => e.value == v.value) != -1;
    }
    if (selected == null) return false;
    return selected!.value == v.value;
  }

  void onTapHandel(GUserProfileData_userProfile_fields_options v) {
    GUserProfileFieldOptionInputBuilder builder =
        GUserProfileFieldOptionInputBuilder();
    builder.name = v.name;
    builder.value = v.value;
    if (!widget.isMultiple) {
      setState(() => selected = builder.build());
      widget.onValueChange([selected!]);
      return;
    }
    int index = mulSelected.indexWhere((e) => e.value == v.value);
    if (index != -1)
      mulSelected.removeWhere((e) => e.value == v.value);
    else
      mulSelected.add(builder.build());

    widget.onValueChange(mulSelected);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 20.h,
      childAspectRatio: 95.w / 36.w,
      children: List.generate(
        widget.list.length,
        (i) => TextChip(
          text: widget.list[i].name,
          isSelected: checkIsSelected(widget.list[i]),
          onTap: () {
            onTapHandel(widget.list[i]);
          },
        ),
      ),
    );
  }
}
