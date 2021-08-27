import 'package:flutter/material.dart';
import 'package:rime_app/theme.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.width = 18,
    this.shape,
    this.materialTapTargetSize,
    this.side,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final double width;
  final OutlinedBorder? shape;
  final MaterialTapTargetSize? materialTapTargetSize;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: width / 18,
      child: Checkbox(
        activeColor: activeColor ?? highlightColor,
        value: value,
        materialTapTargetSize: materialTapTargetSize,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
        onChanged: onChanged,
        side: side,
      ),
    );
  }
}
