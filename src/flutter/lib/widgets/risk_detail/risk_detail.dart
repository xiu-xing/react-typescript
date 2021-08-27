import 'package:flutter/material.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/widgets/webview_page.dart';

class RiskDetail extends StatefulWidget {
  final String title;
  final String entityName;
  final String riskId;
  RiskDetail({
    Key? key,
    required this.title,
    required this.entityName,
    required this.riskId,
  }) : super(key: key);

  @override
  _RiskDetailState createState() => _RiskDetailState();
}

class _RiskDetailState extends State<RiskDetail> {
  @override
  Widget build(BuildContext context) {
    return WebviewPage(
        url:
            '$WEB_ENDPOINT/mobile/risk-detail?title=${Uri.encodeComponent(widget.title)}&entityName=${Uri.encodeComponent(widget.entityName)}&riskId=${Uri.encodeComponent(widget.riskId)}');
  }
}
