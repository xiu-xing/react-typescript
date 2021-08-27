import 'package:flutter/material.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/router.dart';
import 'package:rime_app/models/action/action.dart';

const ACTION_TYPE_PROFILE = "PROFILE";
const ACTION_TYPE_SUB_PROFILE = "SUB_PROFILE";
const ACTION_TYPE_EXTERNAL_LINK = "EXTERNAL_LINK";
const ACTION_TYPE_POP_UP = "POP_UP";
const ACTION_TYPE_RISK_DETAIL = "RISK_DETAIL";

class FluroUtil {
  static void navigatorByAction(
    BuildContext? context, {
    required ActionModel tapAction,
    String? entityName,
    String? title,
  }) {
    if (context == null) return;
    switch (tapAction.type) {
      case ACTION_TYPE_EXTERNAL_LINK:
        //CommonWebView
        if (tapAction.args?["url"] == null) return;
        String url = tapAction.args!["url"] ?? "";
        router.navigateTo(
            context, "${Routes.webviewPage}?url=${Uri.encodeComponent(url)}");
        break;
      case ACTION_TYPE_PROFILE:
        if (tapAction.args == null) return;
        String? id = tapAction.args!["entity_id"];
        String? type = tapAction.args!["entity_type"];
        if (id != null && type != null) {
          router.navigateTo(context, '${Routes.profile}?id=$id&type=$type');
        }
        break;

      case ACTION_TYPE_SUB_PROFILE:
        if (tapAction.args == null) return;
        String? id = tapAction.args!["entity_id"];
        String? type = tapAction.args!["entity_type"];
        String? subProfileId = tapAction.args!["sub_profileId"];
        if (id != null && type != null && subProfileId != null) {
          router.navigateTo(context,
              '${Routes.subProfile}?id=$id&type=$type&subProfileId=$subProfileId');
        }
        break;
      case ACTION_TYPE_RISK_DETAIL:
        String? t = title;
        String? e = entityName;
        String? d = tapAction.args?["risk_id"];
        if (t != null && e != null && d != null) {
          router.navigateTo(
            context,
            '${Routes.riskDetailWebview}?title=${Uri.encodeComponent(t)}&entityName=${Uri.encodeComponent(e)}&riskId=$d',
          );
        }
        break;
    }
  }

  static VoidCallback? autoOnTap(
      BuildContext context, Map<String, dynamic>? config,
      [String key = "item_action"]) {
    if (config == null || !(config is Map<String, dynamic>)) {
      return null;
    }

    final v = config[key];
    if (v == null || !(v is List) || v.length == 0) {
      return null;
    }

    final first = v.first;
    if (!(first is Map<String, dynamic>)) {
      return null;
    }
    final action = first['action'];
    if (action == null && !(action is Map<String, dynamic>)) {
      return null;
    }

    final type = action['type'];
    if (type != ACTION_TYPE_EXTERNAL_LINK && type != ACTION_TYPE_PROFILE) {
      return null;
    }

    final args = action['args'];
    if (!(args is List) || args.length < 2) {
      return null;
    }

    return () => FluroUtil.navigatorByAction(
          context,
          tapAction: ActionModel.fromJson(action),
        );
  }
}
