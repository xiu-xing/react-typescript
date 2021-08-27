import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/widgets/common/circular_progress/circular_progress.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _AdvertisementState createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement>
    with AutomaticKeepAliveClientMixin {
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IndexedStack(
      index: _index,
      children: [
        CircularProgress(size: 32.sp),
        WebView(
          initialUrl: WEB_ENDPOINT + widget.url,
          onPageFinished: (_) {
            setState(() => _index = 1);
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
