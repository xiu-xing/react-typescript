import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:rime_app/widgets/common/loading/loading.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class ResearchPDFViewer extends StatefulWidget {
  final String url;
  final String title;
  ResearchPDFViewer({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _ResearchPDFViewerState createState() => _ResearchPDFViewerState();
}

class _ResearchPDFViewerState extends State<ResearchPDFViewer> {
  final stoarge = new FlutterSecureStorage();
  bool _isLoading = true;

  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<String> _token() async {
    String? _t = await stoarge.read(key: "token");
    return _t ?? "";
  }

  _init() async {
    setState(() => _isLoading = true);
    String? _t = await _token();

    if (_t != "") {
      document = await PDFDocument.fromURL(widget.url, headers: {
        "Cookie": "access_token=$_t",
      });
    }
    setState(() => _isLoading = false);
  }

  Widget _loadingWidget() {
    return Center(
      child: Loading(
        scale: 0.4,
      ),
    );
  }

  Widget _loadingErrorWidget() {
    return Empty404();
  }

  Widget _dataWidget() {
    return PDFViewer(
      document: document,
      backgroundColor: Colors.white,
      scrollDirection: Axis.vertical,
      indicatorBackground: primaryColor,
      showNavigation: false,
      showPicker: false,
      lazyLoad: false,
      progressIndicator: _loadingWidget(),
      indicatorBuilder: (_, pageNumber, totalPages) {
        return Positioned(
          top: 20,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Text(
              "$pageNumber/$totalPages",
              style: bodyText2.copyWith(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppbar(
        customizable: true,
        elevation: 0,
        title: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: _isLoading ? _loadingWidget() : _dataWidget(),
      // body: FutureBuilder<String>(
      //   future: _token(),
      //   builder: (ctx, snapshot) {
      //     Widget widget;
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasError) {
      //         widget = _loadingErrorWidget();
      //       } else {
      //         widget = _dataWidget(snapshot.data ?? "");
      //       }
      //     } else {
      //       widget = _loadingWidget();
      //     }
      //     return widget;
      //   },
      // ),
    );
  }
}
