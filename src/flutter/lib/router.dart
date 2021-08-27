import 'package:fluro/fluro.dart';
import 'package:rime_app/splash_page.dart';
import 'package:rime_app/widgets/404.dart';
import 'package:rime_app/widgets/about/about.dart';
import 'package:rime_app/widgets/authorization/sign_in_next.dart';
import 'package:rime_app/widgets/chart/chart.dart';
import 'package:rime_app/widgets/contact/contact.dart';
import 'package:rime_app/widgets/feedback/feedback.dart';
import 'package:rime_app/widgets/market_management/market_management.dart';
import 'package:rime_app/widgets/payment/payment.dart';
import 'package:rime_app/widgets/profile/profile.dart';
import 'package:rime_app/widgets/quick_search/quick_search.dart';
import 'package:rime_app/widgets/research/research.dart';
import 'package:rime_app/widgets/research_profile/research_profile.dart';
import 'package:rime_app/widgets/risk_detail/risk_detail.dart';
import 'package:rime_app/widgets/share.dart';
import 'package:rime_app/widgets/skeleton.dart';
import 'package:rime_app/widgets/sub_profile/sub_profile.dart';
import 'package:rime_app/widgets/tracker_entity/tracker_entity.dart';
import 'package:rime_app/widgets/user_info/user_profile.dart';
import 'package:rime_app/widgets/user_info/verify_phone.dart';
import 'package:rime_app/widgets/verification_next/verification.dart';
import 'package:rime_app/widgets/verification_next/verify/verify.dart';
import 'package:rime_app/widgets/vertical_chart/vertical_chart.dart';
import 'package:rime_app/widgets/webview/webview.dart';
import 'package:rime_app/widgets/webview_page.dart';
import 'package:rime_app/widgets/user_info/personal_info/personal_info.dart';
import 'package:rime_app/widgets/user_info/personal_info/nickname.dart';

import 'models/route/routes.dart';

final router = FluroRouter();

void defineRoutes(FluroRouter router) {
  router.notFoundHandler = Handler(handlerFunc: (context, params) {
    // print("router not found");
    return Empty404Page();
  });

  /// home
  router.define(
    Routes.home,
    handler: Handler(handlerFunc: (context, params) {
      return Skeleton();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.splash,
    handler: Handler(handlerFunc: (context, params) {
      return SplashPage();
    }),
    transitionType: TransitionType.fadeIn,
    transitionDuration: Duration(milliseconds: 500),
  );

  /// webview
  router.define(
    Routes.webview,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? url = params["url"]?.first;
      String? title = params["title"]?.first;
      return CommonWebView(title: title ?? "", url: url ?? "");
    }),
    transitionType: TransitionType.cupertino,
  );

  /// qksh
  router.define(
    Routes.quickSearch,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? index = params['index']?.first;
      return QuickSearch(tabIndex: index != null ? int.parse(index) : 0);
    }),
    transitionType: TransitionType.cupertino,
  );

  /// authorization 相关的路由.
  router.define(
    Routes.signIn,
    handler: Handler(handlerFunc: (context, params) {
      return SignInNext();
      // return SignIn();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.verifyPhone,
    handler: Handler(handlerFunc: (context, params) {
      return VerifyPhone();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.userProfile,
    handler: Handler(handlerFunc: (context, params) {
      String? place = params["place"]?.first;
      return UserProfile(place: place ?? "home");
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.verfication,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return Verification();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.verified,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? prop = params["verifyMethod"]?.first;
      VerifyMethod vm = VerifyMethod.invitationCode;
      if (prop == "uploadBussinesCard") {
        vm = VerifyMethod.uploadBussinesCard;
      }

      return Verified(verifyMethod: vm);
    }),
    transitionType: TransitionType.cupertino,
  );

  /// contact
  router.define(
    Routes.contact,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return Contact();
    }),
    transitionType: TransitionType.cupertino,
  );

  // feedback
  router.define(
    Routes.feedBack,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return FeedBack();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.profile,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? id = params["id"]?.first;
      String? type = params["type"]?.first;
      if (id != null && type != null)
        return Profile(
          id: id,
          type: type,
        );
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.subProfile,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? id = params["id"]?.first;
      String? type = params["type"]?.first;
      String? subProfileId = params["subProfileId"]?.first;
      if (id != null && type != null && subProfileId != null)
        return SubProfile(
          id: subProfileId,
          entityId: id,
          entityType: type,
        );
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.chart,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? chartId = params["chartId"]?.first;
      String? entityId = params["entityId"]?.first;
      String? entityType = params["entityType"]?.first;
      String? graphId = params["graphId"]?.first;
      if (entityId != null &&
          entityType != null &&
          (chartId != null || graphId != null))
        return Chart(
          entityId: entityId,
          entityType: entityType,
          chartId: chartId,
          graphId: graphId,
        );
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.verticalChart,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? verticalId = params["verticalId"]?.first;
      String? metricsId = params["metricsId"]?.first;
      String? year = params["year"]?.first;
      String? quarter = params["quarter"]?.first;
      if (verticalId != null &&
          metricsId != null &&
          year != null &&
          quarter != null)
        return VerticalChart(
          verticalId: verticalId,
          metricsId: metricsId,
          year: year,
          quarter: quarter,
        );
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.webviewPage,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? url = params["url"]?.first;

      if (url != null)
        return WebviewPage(
          url: url,
        );
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.research,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return Research();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.researchProfile,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? id = params["id"]?.first;
      String? articleModuleId = params["articleModuleId"]?.first;

      if (id != null && articleModuleId != null) {
        return ResearchProfile(
          id: id,
          articleModuleId: articleModuleId,
        );
      }
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.riskDetailWebview,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? title = params["title"]?.first;
      String? entityName = params["entityName"]?.first;
      String? data = params["riskId"]?.first;
      if (title != null && entityName != null && data != null)
        return RiskDetail(title: title, entityName: entityName, riskId: data);
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.share,
    handler: Handler(handlerFunc: (context, params) {
      String title = params["title"]?.first ?? "";
      String? content = params["content"]?.first;
      String? publish = params["publishTime"]?.first;
      return Share(title: title, content: content, publishTime: publish);
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.trakerEntities,
    handler: Handler(handlerFunc: (c, p) {
      return TrackerEntities();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.about,
    handler: Handler(handlerFunc: (context, params) {
      return About();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.marketManagement,
    handler: Handler(handlerFunc: (context, params) {
      return MarketManagement();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.payment,
    handler: Handler(handlerFunc: (context, params) {
      String? time = params["serviceEndTime"]?.first;
      return Payment(serviceEndTime: time);
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.personalInfo,
    handler: Handler(handlerFunc: (context, params) {
      return PersonalInfo();
    }),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    Routes.nickName,
    handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String? name = params["name"]?.first;
      if (name != null) {
        return NickName(name: name);
      }
    }),
    transitionType: TransitionType.cupertino,
  );
}
