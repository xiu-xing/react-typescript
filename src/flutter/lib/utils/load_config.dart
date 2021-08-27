import 'dart:convert';

import 'package:rime_app/common/env.dart';
import 'package:rime_app/utils/http.dart';
import 'package:rime_app/utils/storage.dart';

Future<Map<String, dynamic>?> getConfig(String fileName) async {
  if (fileName == "") {
    return null;
  }

  String configs = LocalStorage.sharedPreferences.getString(fileName) ?? "";
  if (configs == "") {
    configs = await loadConfig(fileName);
  }
  if (configs == "") {
    return null;
  }
  Map<String, dynamic> jsonValue = json.decode(configs);
  return jsonValue;
}

Future<String> loadConfig(String fileName) async {
  var dioRes = await HttpUtils.request(
    "$STATIC_FILE_PATH/$fileName",
    method: HttpUtils.GET,
  );
  if (dioRes == null) return "";
  if (dioRes.length > 0) {
    LocalStorage.sharedPreferences.setString(fileName, dioRes);
    return dioRes;
  }
  return "";
}
