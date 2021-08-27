import 'dart:convert';
import 'dart:io';

import 'package:muse_dart/muse.dart';
import 'package:rime_app/common/env.dart';

class MuseEventUtil {
  // set event id here
  static const AppErrorEventId = 'error';
  static const SignInEventId = 'sign_in';
  static const AccountItemClickId = 'account.click';
  static const PersonalInfoUpdateId = 'personal_info.click';
  static const PersonalInfoNickname = 'personal_nickname.click';
  static const PaymentVIPId = 'payment';
  static const CancelTrackerId = 'untracked_entity';
  static const SubmitFeedbackId = 'feedback.submit';
  static const DiscoveryId = 'discovery_grid_item.click';
  static const DiscoveryTabsItemId = 'discovery_tab.click';
  static const RealmTabBarId = 'realm.click';
  static const TrackerTabsItemTabBarId = 'tracker_timeline.click';
  static const RealmSearchEventId = 'realm.search';
  static const ProfileEventId = 'profile.view';
  static const SubProfileEventId = 'sub_profile.view';
  static const ProfileChartEventId = 'chart.view';

  static MuseClient _museClient = MuseClient(MuseOptions(debug: IS_DEV));

  static Future<bool> sendEntity({
    required String eventId,
    required String entityId,
    required String entityType,
  }) {
    var jsonValue = {
      "entity": {
        "value": {"id": entityId, "type": entityType}
      }
    };
    return _museClient.sendTrackingEvent(
      EventInfo(eventID: eventId, eventProperties: jsonEncode(jsonValue)),
    );
  }

  static Future<bool> sendEvent({
    required String eventId,
    required Object value,
  }) {
    return _museClient.sendTrackingEvent(
      EventInfo(eventID: eventId, eventProperties: jsonEncode(value)),
    );
  }

  static MuseClient getInstance() {
    return _museClient;
  }

  static init({required String appId}) async {
    if (Platform.isAndroid)
      _museClient.options?.platform = IOPlatform.android;
    else
      _museClient.options?.platform = IOPlatform.ios;

    _museClient.init(MUSE_ENDPOINT, appId);
    _museClient.initDeviceInfo();
  }
}
