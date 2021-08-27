import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/realm/realm.data.gql.dart';
import 'package:rime_app/graphql/queries/realm/realm.req.gql.dart';
import 'package:rime_app/graphql/queries/realm/realm.var.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/widgets/common/404/404.dart';
import 'package:rime_app/widgets/common/appbar/preferred_size_bar.dart';
import 'package:rime_app/widgets/common/loading/loading.dart';
import 'package:rime_app/widgets/common/static_search_field.dart';
import 'package:rime_app/widgets/realm/realm_display.dart';

/// main tab 数据库页
class Realm extends StatefulWidget {
  @override
  _RealmState createState() => _RealmState();
}

class _RealmState extends State<Realm> with AutomaticKeepAliveClientMixin {
  List<GAppRealmData_appRealms> _realms = [];
  bool _realmsQueryError = false;
  bool _fetching = true;

  void sendRealmsQuery() {
    if (_fetching == false) {
      setState(() => _fetching = true);
    }
    GQL.executeQuery<GAppRealmData, GAppRealmVars>(
      GAppRealmReq(),
      onData: (s, r) {
        _fetching = false;
        if (r.data?.appRealms != null) {
          _realms = r.data!.appRealms.toList();
          _realmsQueryError = false;
        } else {
          _realmsQueryError = true;
        }
        if (mounted) setState(() => {});
        s.cancel();
      },
      onError: (s, err) {
        _realms = [];
        _realmsQueryError = true;
        _fetching = false;
        if (mounted) setState(() => {});
        s.cancel();
      },
    );
  }

  Widget bodyWidget() {
    if (_fetching) return Container();
    if (_realmsQueryError) return Empty404(reload: sendRealmsQuery);

    return RealmDisplay(realms: _realms);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => sendRealmsQuery());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: PreferredSizeBar(
            overlayStyle: SystemUiOverlayStyle.dark,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              // height: 36.h,
              child: GestureDetector(
                onTap: () => router.navigateTo(context, Routes.quickSearch),
                child: StaticSearchField(),
              ),
            ),
          ),
          body: bodyWidget(),
        ),
        if (_fetching) Center(child: Loading(scale: .4)),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
