import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double? scale;
  const Loading({Key? key, this.scale = 1.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/loading.gif',
      width: 375 * (this.scale ?? 1.0),
      height: 109 * (this.scale ?? 1.0),
    );
  }
}
