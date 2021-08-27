import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/ac/ac.dart';

import '../router.dart';
import 'common/appbar/primary_appbar.dart';
import 'common/loading/loading.dart';

class WebviewPage extends StatefulWidget {
  final String url;
  final DeviceOrientation? orientation;
  final bool? hideAppbar;
  final List<Widget>? actions;
  final bool opactityTitle;

  WebviewPage({
    Key? key,
    required this.url,
    this.orientation = DeviceOrientation.portraitUp,
    this.hideAppbar = false,
    this.actions,
    this.opactityTitle = false,
  }) : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<_WebviewPageState> webViewKey =
      GlobalKey<_WebviewPageState>();

  InAppWebViewController? _webViewController;
  CookieManager cookieManager = CookieManager.instance();
  double progress = 0;
  late PullToRefreshController pullToRefreshController;
  String title = "";
  bool hideTitle = true;
  final storage = new FlutterSecureStorage();
  bool loadError = false;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      // todo https://github.com/pichillilorenzo/flutter_inappwebview/issues/863
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      supportZoom: false,
      userAgent:
          'Mozilla/5.0 (Linux; Android 4.1.1; Galaxy Nexus Build/JRO03C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19',
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
      allowsBackForwardNavigationGestures: false,
    ),
  );

  @override
  void initState() {
    super.initState();

    cookieManager.deleteCookie(
        url: Uri.parse(widget.url), name: "access_token", domain: DOMAIN);
    if (widget.orientation != null) {
      SystemChrome.setPreferredOrientations([widget.orientation!]);
    }

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: primaryColor,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          _webViewController?.reload();
        } else if (Platform.isIOS) {
          _webViewController?.loadUrl(
              urlRequest: URLRequest(url: await _webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _webViewController?.removeJavaScriptHandler(handlerName: "showACDialog");

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _showACDialogHandler(List<dynamic> _) async {
    await context.showAC(onClose: () => Navigator.of(context)..pop()..pop());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.hideAppbar!
          ? null
          : CommonAppbar(
              customizable: true,
              title: AnimatedOpacity(
                opacity: !widget.opactityTitle
                    ? 1
                    : hideTitle
                        ? 0
                        : 1,
                curve: Curves.linear,
                duration: Duration(milliseconds: 200),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: headline2.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              elevation: 0,
              actions: widget.actions,
            ),
      body: loadError
          ? Empty404()
          : SafeArea(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialOptions: options,
                    onScrollChanged: (_, x, y) {
                      if (y > 100 && hideTitle) {
                        setState(() => hideTitle = false);
                      }
                      if (y <= 100 && !hideTitle) {
                        setState(() => hideTitle = true);
                      }
                    },
                    pullToRefreshController: pullToRefreshController,
                    onWebViewCreated: (controller) async {
                      _webViewController = controller;

                      _webViewController?.addJavaScriptHandler(
                        handlerName: "showACDialog",
                        callback: _showACDialogHandler,
                      );

                      String uri = widget.url;

                      String? token = await storage.read(key: "token");

                      if (token != null) {
                        await cookieManager.setCookie(
                            url: Uri.parse(uri),
                            name: "access_token",
                            domain: DOMAIN,
                            value: token,
                            expiresDate: DateTime.now()
                                .add(Duration(days: 7))
                                .millisecondsSinceEpoch);

                        await _webViewController?.loadUrl(
                            urlRequest: URLRequest(url: Uri.parse(uri)));
                      }
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      String url = navigationAction.request.url.toString();

                      if (Platform.isIOS) {
                        if (url != "about:blank") {
                          if (widget.url.contains(DOMAIN)) {
                            if (url.startsWith("js://webview")) {
                              String path = url.replaceAll("js://webview", "");

                              switch (matchRoute(path)) {
                                case "/exit":
                                  router.pop(context);
                                  break;
                                case Routes.profile:
                                case Routes.subProfile:
                                case Routes.chart:
                                case Routes.verticalChart:
                                case Routes.riskDetailWebview:
                                  router.navigateTo(context, path);
                                  break;
                                default:
                                  break;
                              }
                              return NavigationActionPolicy.CANCEL;
                            } else {
                              if (url == widget.url) {
                                return NavigationActionPolicy.ALLOW;
                              } else {
                                router.navigateTo(context,
                                    "${Routes.webviewPage}?url=${Uri.encodeComponent(url)}");
                                return NavigationActionPolicy.CANCEL;
                              }
                            }
                          } else {
                            return NavigationActionPolicy.ALLOW;
                          }
                        }

                        return NavigationActionPolicy.ALLOW;
                      } else {
                        if (widget.url.contains(DOMAIN)) {
                          if (url.startsWith("js://webview")) {
                            String path = url.replaceAll("js://webview", "");

                            switch (matchRoute(path)) {
                              case "/exit":
                                router.pop(context);
                                break;
                              case Routes.profile:
                              case Routes.subProfile:
                              case Routes.chart:
                              case Routes.verticalChart:
                              case Routes.riskDetailWebview:
                                router.navigateTo(context, path);
                                break;
                              default:
                                break;
                            }
                          } else {
                            router.navigateTo(context,
                                "${Routes.webviewPage}?url=${Uri.encodeComponent(url)}");
                          }
                          return NavigationActionPolicy.CANCEL;
                        } else if (url.contains(DOMAIN)) {
                          router.navigateTo(context,
                              "${Routes.webviewPage}?url=${Uri.encodeComponent(url)}");
                          return NavigationActionPolicy.CANCEL;
                        }
                        return NavigationActionPolicy.ALLOW;
                      }
                    },
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        pullToRefreshController.endRefreshing();
                      }
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                    onLoadStop: (controller, url) async {
                      pullToRefreshController.endRefreshing();
                      String? title = await _webViewController
                          ?.evaluateJavascript(source: "document.title");
                      setState(() {
                        this.title = title ?? "document";
                      });
                    },
                    onLoadError: (controller, url, code, message) async {
                      pullToRefreshController.endRefreshing();
                      setState(() {
                        loadError = true;
                      });
                    },
                    onConsoleMessage: (controller, consoleMessage) {
                      print(consoleMessage.message);
                    },
                  ),
                  progress < 1.0 && title == ""
                      ? Container(
                          color: Colors.white,
                          child: Center(
                            child: Loading(scale: .4),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
    );
  }

  String matchRoute(String path) {
    String pathName = path;

    if (path.contains("?")) {
      pathName = path.split("?")[0];
    }

    return pathName;
  }
}
