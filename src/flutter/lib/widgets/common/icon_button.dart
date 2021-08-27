import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final double size;
  final EdgeInsets margin;
  final Widget icon;
  final void Function() onTap;
  final Color backgroundColor;
  final ShapeBorder shape;

  CommonIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.margin = EdgeInsets.zero,
    this.size = 36,
    this.backgroundColor = Colors.transparent,
    this.shape = const CircleBorder(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: shape,
      child: Container(
        margin: margin,
        height: size,
        width: size,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(size / 2)),
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onTap,
          child: icon,
        ),
      ),
    );
  }
}
