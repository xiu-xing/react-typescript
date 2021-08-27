import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopUpMenu extends StatefulWidget {
  final double? menuHeight;
  final Widget? menuContent;

  PopUpMenu({Key? key, this.menuHeight, this.menuContent}) : super(key: key);

  @override
  PopUpMenuState createState() => PopUpMenuState();
}

class PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.menuHeight,
      child: widget.menuContent,
    );
  }
}
