import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/research/research.data.gql.dart';
import 'package:rime_app/graphql/queries/research/research.req.gql.dart';
import 'package:rime_app/graphql/queries/research/research.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/ac/ac.dart';
import 'package:rime_app/widgets/common/circular_progress/circular_progress.dart';
import 'package:rime_app/widgets/research_pdf_viewer/research_pdf_viewer.dart';

class ResearchPhotoViewer extends StatefulWidget {
  final String url;
  final String token;
  final String articleModuleId;
  final String reportId;
  ResearchPhotoViewer({
    Key? key,
    required this.url,
    required this.token,
    required this.reportId,
    required this.articleModuleId,
  }) : super(key: key);

  @override
  _ResearchPhotoViewerState createState() => _ResearchPhotoViewerState();
}

class _ResearchPhotoViewerState extends State<ResearchPhotoViewer> {
  Map<String, dynamic> data = {};
  GArticleUriData_appArticleUri? uriData = GArticleUriData_appArticleUri();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchData() async {
    var detail = await _getArticleDetail();
    Map<String, dynamic> mapData = jsonDecode(detail);

    setState(() {
      this.data = mapData;
    });

    String id = mapData["kw.id"] ?? "";

    if (id != "") {
      var uriDetail = await _getArticleUri(id);

      setState(() {
        this.uriData = uriDetail;
      });
    }
  }

  Future<String> _getArticleDetail() {
    Completer<String> _completer = new Completer();
    GQL.executeQuery<GArticleDetailData, GArticleDetailVars>(
      GArticleDetailReq(
        (b) => b
          ..vars.articleModuleID = widget.articleModuleId
          ..vars.id = widget.reportId,
      ),
      context: context,
      onData: (s, d) {
        s.cancel();
        if (!_completer.isCompleted)
          _completer.complete(d.data?.appArticleDetail?.data);
        if (d.data?.appArticleDetail?.data != null) {
          setState(() {
            data = jsonDecode(d.data!.appArticleDetail!.data);
          });
        }
      },
      onError: (s, e) {
        if (!_completer.isCompleted) _completer.completeError(e);
        s.cancel();
      },
    );
    return _completer.future;
  }

  Future<GArticleUriData_appArticleUri?> _getArticleUri(String id) {
    Completer<GArticleUriData_appArticleUri?> _completer = new Completer();

    GQL.executeQuery<GArticleUriData, GArticleUriVars>(
      GArticleUriReq(
        (u) => u
          ..vars.articleModuleID = widget.articleModuleId
          ..vars.articleType = GArticleType.ARTICLE_TYPE_RESEARCH_REPORT
          ..vars.fetchType = GFetchType.FETCH_TYPE_READ
          ..vars.id = id,
      ),
      context: context,
      onData: (s, d) {
        s.cancel();
        _completer.complete(d.data?.appArticleUri);
      },
      onError: (s, e) {
        s.cancel();
        _completer.completeError(e);
      },
    );

    return _completer.future;
  }

  Future<void> _onClickPDF() async {
    String title = data["ik.title"] ?? "";

    if ((this.uriData?.numOfUnusedRead ?? 0) > 0) {
      String uri = '$STORAGE_ENDPOINT${this.uriData?.resourceURI}';

      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => ResearchPDFViewer(
            url: uri,
            title: title,
          ),
        ),
      );
    } else {
      await context.showAC(type: ACDialogType.ReadLimit, message: "访问次数不足");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: PhotoView(
              imageProvider: NetworkImage(
                widget.url,
                headers: {"Cookie": "access_token=${widget.token}"},
              ),
              heroAttributes: PhotoViewHeroAttributes(tag: widget.url),
              loadingBuilder: (context, event) {
                return CircularProgress();
              },
            ),
          ),
          Positioned(
            top: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(10, 10)),
                        backgroundColor: MaterialStateProperty.all(
                          Pigment.fromString("#262626").withOpacity(0.8),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                        ),
                      ),
                      onPressed: _onClickPDF,
                      child: Text(
                        "查看原文",
                        style: bodyText2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // Material(
                    //   borderRadius: BorderRadius.circular(2.0.w),
                    //   color: Pigment.fromString("#262626").withOpacity(0.8),
                    //   child: InkWell(
                    //     borderRadius: BorderRadius.circular(2.0.w),
                    //     onTap: () {
                    //       print("...");
                    //     },
                    //     child: Container(
                    //       padding: EdgeInsets.all(4.w),
                    //       child: Icon(
                    //         Icons.ac_unit,
                    //         size: 20.sp,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          data["ik.title"] != null
              ? Positioned(
                  bottom: 0,
                  child: SafeArea(
                    child: Container(
                      color: Pigment.fromString("#262626").withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        data["ik.title"]!,
                        style: bodyText2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
