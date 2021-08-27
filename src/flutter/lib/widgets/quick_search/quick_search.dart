import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/widgets/common/appbar/preferred_size_bar.dart';
import 'package:rime_app/widgets/quick_search/defalut_page.dart';
import 'package:rime_app/widgets/quick_search/display_page.dart';
import 'package:rime_app/widgets/quick_search/provider.dart';
import 'package:rime_app/widgets/quick_search/widgets/search_title.dart';
import 'package:tuple/tuple.dart';

class QuickSearch extends StatefulWidget {
  final int? tabIndex;

  QuickSearch({Key? key, this.tabIndex}) : super(key: key);

  @override
  _QuickSearchState createState() => _QuickSearchState();
}

class _QuickSearchState extends State<QuickSearch> {
  QuickSearchProvider _provider = QuickSearchProvider();

  @override
  void initState() {
    super.initState();
    _provider.init();
  }

  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuickSearchProvider>.value(
      value: _provider,
      child: Selector<QuickSearchProvider, Tuple2<int, bool>>(
        selector: (_, p) => Tuple2(p.tabs.length, p.keywordEmpty),
        builder: (c, t, _) {
          Widget _body = QuickSearchDefaultPage();
          if (!t.item2) {
            _body = QuickSearchDisplayPage(tabLen: t.item1);
          }

          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: PreferredSizeBar(
              child: SearchTitle(),
              overlayStyle: SystemUiOverlayStyle.dark,
            ),
            body: SafeArea(child: _body),
          );
        },
      ),
    );
  }
}
