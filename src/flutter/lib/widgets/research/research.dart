import 'package:flutter/material.dart' hide BottomSheet, TabBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/widgets/research/provider.dart';
import 'package:rime_app/widgets/research/widgets/filter_button.dart';
import 'package:rime_app/widgets/research/widgets/search_input/search_input.dart';
import '../../theme.dart';
import 'widgets/article_list/article_list.dart';

class Research extends StatefulWidget {
  Research({Key? key}) : super(key: key);

  @override
  _ResearchState createState() => _ResearchState();
}

class _ResearchState extends State<Research>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late GlobalKey key = GlobalKey();

  late ResearchProvider _provider;
  ValueNotifier<int> _index = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _provider = new ResearchProvider(context)..init();
    _tabController =
        TabController(length: _provider.moduleIds.length, vsync: this)
          ..addListener(() {
            _index.value = _tabController.index;
            _provider.updateIndex(_tabController.index);
          });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            splashRadius: 24.sp,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
            ),
          ),
          title: ValueListenableBuilder<int>(
            valueListenable: _index,
            builder: (context, value, child) {
              return Wrap(
                children: _provider.moduleLables
                    .map((e) => Ink(
                          child: InkWell(
                            onTap: () {
                              _tabController
                                  .animateTo(_provider.moduleLables.indexOf(e));
                            },
                            child: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.w,
                                    horizontal: 16.w,
                                  ),
                                  child: Text(
                                    e,
                                    style: bodyText1.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: value ==
                                              _provider.moduleLables.indexOf(e)
                                          ? primaryColor
                                          : Pigment.fromString("#737373"),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 16.w,
                                  height: 2.w,
                                  color:
                                      value == _provider.moduleLables.indexOf(e)
                                          ? primaryColor
                                          : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          actions: [FilterButton()],
        ),
        body: Column(
          children: [
            SearchInput(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: _provider.moduleIds
                    .map(
                      (e) => ArticleListWrapper(
                        articleModuleID: e,
                        articleListID: _provider.getArticleListIdByModuleId(e),
                        articleType: _provider.getArticleTypeByModuleId(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
