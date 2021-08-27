import 'package:flutter/material.dart';
import 'package:rime_app/widgets/common/common_tab_bar/common_tab_bar.dart';
import 'package:rime_app/widgets/quick_search/widgets/list/latest_view.dart';
import 'package:rime_app/widgets/quick_search/widgets/list/trending.dart';

class QuickSearchDefaultPage extends StatefulWidget {
  const QuickSearchDefaultPage({Key? key}) : super(key: key);

  @override
  _QuickSearchDefaultPageState createState() => _QuickSearchDefaultPageState();
}

class _QuickSearchDefaultPageState extends State<QuickSearchDefaultPage>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTabBar(
          elevation: 1,
          tabs: ["大家都在看", "最近浏览"],
          controller: _controller,
        ),
        Expanded(
          child: GestureDetector(
            onPanDown: (_) => FocusScope.of(context).requestFocus(FocusNode()),
            child: TabBarView(
              controller: _controller,
              children: [TrendingList(), LatestViewList()],
            ),
          ),
        )
      ],
    );
  }
}
