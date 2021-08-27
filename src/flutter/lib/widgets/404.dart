import 'package:flutter/material.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';

class Empty404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(darkTheme: false, customizable: true, elevation: 0),
      backgroundColor: Colors.white,
      body: Empty404(),
    );
  }
}
