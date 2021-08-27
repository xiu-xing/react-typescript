import 'package:flutter/widgets.dart';
import 'package:rime_app/common/global.dart';

class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({required this.child});

  static restartApp(BuildContext context) {
    final _RestartWidgetState? state =
        context.findAncestorStateOfType<_RestartWidgetState>();
    state?.restartApp();
  }

  @override
  _RestartWidgetState createState() => new _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = new UniqueKey();
  bool showSnackBar = false;

  void restartApp() {
    setState(() {
      key = new UniqueKey();
    });
  }

  void initGetui() {
    Global.getuiPushUtil.initPlatformState().then((platformVersion) {
      if (platformVersion == 'Failed to get platform version.') return;
      Global.getuiPushUtil.addEventHandler();
      Global.getuiPushUtil.initGetuiSdk();
      Global.getuiPushUtil.resetBadge();
    });
  }

  @override
  void initState() {
    super.initState();
    initGetui();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
