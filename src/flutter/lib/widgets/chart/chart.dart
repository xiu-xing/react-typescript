import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/widgets/webview_page.dart';

class Chart extends StatefulWidget {
  final String entityId;
  final String entityType;
  final String? chartId;
  final String? graphId;

  Chart({
    Key? key,
    required this.entityId,
    required this.entityType,
    this.chartId,
    this.graphId,
  })  : assert(chartId != null || graphId != null),
        super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late String path;

  @override
  void initState() {
    super.initState();
    if (widget.chartId != null) {
      path =
          "$WEB_ENDPOINT/mobile/chart?entityId=${widget.entityId}&entityType=${widget.entityType}&chartId=${widget.chartId}";
    } else {
      path =
          "$WEB_ENDPOINT/mobile/chart?entityId=${widget.entityId}&entityType=${widget.entityType}&graphId=${widget.graphId}";
    }
    MuseEventUtil.sendEvent(
      eventId: MuseEventUtil.ProfileChartEventId,
      value: {
        "entity": {
          "value": {"id": widget.entityId, "type": widget.entityType}
        },
        "chart_id": {"value": widget.chartId ?? widget.graphId}
      },
    );
  }

  @override
  void dispose() {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(375, 667),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewPage(
      hideAppbar: true,
      orientation: DeviceOrientation.landscapeLeft,
      url: path,
    );
  }
}
