import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonWebView extends StatefulWidget {
  final String title;
  final String url;
  CommonWebView({Key? key, required this.title, required this.url})
      : super(key: key);
  @override
  _CommonWebViewState createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  GlobalKey _globalKey = GlobalKey();

  _launchUrl(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        key: _globalKey,
        customizable: true,
        title: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: headline2,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (_) {
              _launchUrl(widget.url);
            },
            icon: SizedBox(
              width: 36.w,
              height: 36.w,
              child: Icon(MdiIcons.dotsHorizontal, color: normalColor),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                  value: 'item1', child: Text('在浏览器中打开'))
            ],
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
