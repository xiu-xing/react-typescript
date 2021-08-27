import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/quick_search/models/tab_info.dart';
import 'package:rime_app/widgets/quick_search/provider.dart';
import 'package:rime_app/widgets/quick_search/widgets/list/search_result.dart';
import 'package:tuple/tuple.dart';

class QuickSearchDisplayPage extends StatefulWidget {
  const QuickSearchDisplayPage({
    Key? key,
    required this.tabLen,
  }) : super(key: key);
  final int tabLen;

  @override
  _QuickSearchDisplayPageState createState() => _QuickSearchDisplayPageState();
}

class _QuickSearchDisplayPageState extends State<QuickSearchDisplayPage>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: widget.tabLen);
  }

  List<Widget> tabPanel() {
    List<Widget> children = [];
    for (int i = 0, size = _controller!.length; i < size; i++) {
      children.add(Selector<QuickSearchProvider, Tuple2<String, TabInfo>>(
        selector: (_, p) => Tuple2(p.keyword, p.quickSearchTabs[i]),
        builder: (c, t, _) {
          return SearchResult(i, keyword: t.item1, tabInfo: t.item2);
        },
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Selector<QuickSearchProvider, Tuple2<List<String>, List<bool>>>(
          selector: (c, p) => Tuple2(p.tabs, p.tabsLocked),
          shouldRebuild: (r, p) => true,
          builder: (c, t, _) {
            return CommonTabBar(
              elevation: 1,
              tabs: t.item1,
              tabLocked: t.item2,
              controller: _controller,
            );
          },
        ),
        Expanded(
          child: GestureDetector(
            onPanDown: (_) => FocusScope.of(context).requestFocus(FocusNode()),
            child: TabBarView(
              controller: _controller,
              children: tabPanel(),
            ),
          ),
        )
      ],
    );
  }
}
