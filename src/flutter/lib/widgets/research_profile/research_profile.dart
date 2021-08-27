import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:pigment/pigment.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/research/research.data.gql.dart';
import 'package:rime_app/graphql/queries/research/research.req.gql.dart';
import 'package:rime_app/graphql/queries/research/research.var.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/widgets/common/ac/ac.dart';
import 'package:rime_app/widgets/common/appbar/primary_appbar.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/common/custom_icons/custom_icons.dart';
import 'package:rime_app/widgets/common/empty/empty.dart';
import 'package:rime_app/widgets/common/network_image.dart';
import 'package:rime_app/widgets/research_pdf_viewer/research_pdf_viewer.dart';
import 'package:rime_app/widgets/research_photo_viewer/research_photo_viewer.dart';

class ResearchProfile extends StatefulWidget {
  ResearchProfile({Key? key, required this.id, required this.articleModuleId})
      : super(key: key);
  final String id;
  final String articleModuleId;

  @override
  _ResearchProfileState createState() => _ResearchProfileState();
}

class _ResearchProfileState extends State<ResearchProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final stoarge = new FlutterSecureStorage();
  List<String> _tabs = ["摘要", "图表"];

  Map<String, dynamic> data = {};
  GArticleUriData_appArticleUri? uriData = GArticleUriData_appArticleUri();
  List? _charts = [];
  String _token = "";

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);

    _getToken();
    _fetchData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(ResearchProfile oldWidget) {
    if (oldWidget.id != widget.id) {
      _fetchData();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _getToken() async {
    String? t = await stoarge.read(key: "token");

    setState(() {
      this._token = t ?? "";
    });
  }

  void _fetchData() async {
    var detail = await _getArticleDetail();
    Map<String, dynamic> mapData = jsonDecode(detail);

    setState(() {
      this.data = mapData;
      this._charts = mapData["charts"];
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
          ..vars.id = widget.id,
      ),
      context: context,
      onData: (s, d) {
        s.cancel();
        _completer.complete(d.data?.appArticleDetail?.data);
        if (d.data?.appArticleDetail?.data != null) {
          setState(() {
            data = jsonDecode(d.data!.appArticleDetail!.data);
          });
        }
      },
      onError: (s, e) {
        _completer.completeError(e);
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

  String _getUri(String id) {
    return "$STORAGE_ENDPOINT/storage/protected/research.report_chart/$id";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppbar(
        customizable: true,
        elevation: 0,
        actions: [
          // IconButton(
          //   splashRadius: 20.w,
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.star_border_outlined,
          //     color: regularColor,
          //   ),
          // ),
          // IconButton(
          //   splashRadius: 20.w,
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.open_in_new,
          //     size: 20.sp,
          //     color: regularColor,
          //   ),
          // ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                Text(
                  data["ik.title"] ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: headline1,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      children: [
                        Text(
                          new DateFormat('yyyy-MM-dd').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                (data["publish_date"] ?? 0) * 1000),
                          ),
                          style: bodyText1.copyWith(color: grey99),
                        ),
                        Text(
                          data["publish_company_name"] ?? "",
                          style: bodyText1.copyWith(color: grey99),
                        ),
                      ],
                    ),
                    Text(
                      "${data["number_of_pages"] ?? 0} 页",
                      style: bodyText1.copyWith(color: grey99),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  onTap: _onClickPDF,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      width: 1.0,
                      color: Pigment.fromString("#F5F5F5"),
                    ),
                  ),
                  leading: Container(
                    width: 32.w,
                    height: 32.w,
                    child: Icon(
                      CustomIcons.pdf,
                      size: 32.sp,
                      color: Pigment.fromString("#E54D5B"),
                    ),
                  ),
                  title: Text(
                    data["ik.title"] ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: bodyText1,
                  ),
                  // subtitle: Text(
                  //   "2.1M",
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: bodyText2.copyWith(color: grey99),
                  // ),
                  contentPadding: const EdgeInsets.only(left: 12.0, right: 8.0),
                  minLeadingWidth: 32,
                  horizontalTitleGap: 8,
                ),
              ],
            ),
          ),
          CommonTabBar(
            tabs: _tabs,
            controller: _tabController,
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: data["description"] != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: Text(
                          data["description"] ?? "",
                          style: bodyText1.copyWith(letterSpacing: 1),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Empty(
                          scale: 0.4,
                        ),
                      ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: (_charts ?? []).length > 0
                      ? List.generate(
                          (_charts ?? []).length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (_charts ?? [])[index]["name"] ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: regularColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: notoSansSC,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => ResearchPhotoViewer(
                                          reportId: widget.id,
                                          articleModuleId:
                                              widget.articleModuleId,
                                          url: _getUri(
                                              (_charts ?? [])[index]["kw.uri"]),
                                          token: _token,
                                        ),
                                      ),
                                    );
                                  },
                                  child: AspectRatio(
                                    aspectRatio: 327 / 140,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Hero(
                                        tag: _getUri(
                                            (_charts ?? [])[index]["kw.uri"]),
                                        child: NetWorkImage(
                                          placeholder: Container(),
                                          httpHeaders: {
                                            "Cookie": "access_token=$_token"
                                          },
                                          image: _getUri(
                                              (_charts ?? [])[index]["kw.uri"]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Empty(
                              scale: 0.4,
                            ),
                          ),
                        ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
