import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/widgets/webview_page.dart';

class VerticalChart extends StatelessWidget {
  final String verticalId;
  final String metricsId;
  final String year;
  final String quarter;

  const VerticalChart(
      {Key? key,
      required this.verticalId,
      required this.metricsId,
      required this.year,
      required this.quarter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewPage(
      hideAppbar: true,
      orientation: DeviceOrientation.landscapeLeft,
      url:
          "$WEB_ENDPOINT/mobile/vertical/chart?verticalId=${this.verticalId}&metricsId=${this.metricsId}&year=${this.year}&quarter=${this.quarter}",
    );
  }
}
