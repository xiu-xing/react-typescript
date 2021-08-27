import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/widgets/common/check_update/check_update.dart';
import 'package:tuple/tuple.dart';

Future<Tuple2<bool, String?>> checkAppVersionUpToDate() async {
  Completer<Tuple2<bool, String?>> _c = new Completer();

  try {
    Response response = await Dio().get(
      CHECK_UPDATE_ENDPOINT + "/app",
      queryParameters: {"id": CHECK_UPDATE_APP_ID},
      options: Options(headers: {"Authorization": CHECK_UPDATE_TOKEN}),
    );

    var latestVersion;

    if (Platform.isAndroid) {
      latestVersion = response.data["latest_android_version"];
    } else if (Platform.isIOS) {
      latestVersion = response.data["latest_ios_version"];
    }

    PackageInfo info = await PackageInfo.fromPlatform();

    int currentVersion = int.parse(info.version.split(".").join(""));
    int version = int.parse(latestVersion["version"].split(".").join(""));

    if (currentVersion < version) {
      _c.complete(Tuple2(true, latestVersion["download_url"]));
    } else {
      _c.complete(Tuple2(false, null));
    }
  } catch (e) {
    _c.completeError(e);
  }

  return _c.future;
}

Future<void> checkUpdate(GlobalKey<NavigatorState> navigatorKey) async {
  try {
    var response = await Dio().get(
      CHECK_UPDATE_ENDPOINT + "/app",
      queryParameters: {"id": CHECK_UPDATE_APP_ID},
      options: Options(headers: {"Authorization": CHECK_UPDATE_TOKEN}),
    );

    var latestVersion;

    if (Platform.isAndroid) {
      latestVersion = response.data["latest_android_version"];
    } else if (Platform.isIOS) {
      latestVersion = response.data["latest_ios_version"];
    }

    if (latestVersion == null) {
      return Future.value();
    }

    PackageInfo info = await PackageInfo.fromPlatform();

    int currentVersion = int.parse(info.version.split(".").join(""));
    int version = int.parse(latestVersion["version"].split(".").join(""));

    if (currentVersion < version) {
      showDialog(
        context: navigatorKey.currentState!.overlay!.context,
        builder: (context) {
          return CheckUpdateDialog(latestVersion["download_url"]);
        },
        barrierDismissible: false,
      );
      return Future.value();
    }
    return Future.value();
  } catch (e) {
    return Future.error(e);
  }
}

// Future<bool> isLatestVersionNext(String version) async {
//   print(info.version);
//   print(version);
//   return true;
// }

// bool isLatestVersion(String checkVersion) {
//   const localVersion = VERSION;
//   var remoteVersion = checkVersion;
//   var localVersionNumbers = localVersion.split(".");
//   var remoteVersionNumbers = remoteVersion.split(".");
//   if (localVersionNumbers.length != 3 || remoteVersionNumbers.length != 3) {
//     return true;
//   }

//   var localVersionSum = 0;
//   var remoteVersionSum = 0;

//   for (var i = 0; i < localVersionNumbers.length; i++) {
//     if (i == 0) {
//       localVersionSum += int.parse(localVersionNumbers[i]) * 100;
//       remoteVersionSum += int.parse(remoteVersionNumbers[i]) * 100;
//     }
//     if (i == 1) {
//       localVersionSum += int.parse(localVersionNumbers[i]) * 10;
//       remoteVersionSum += int.parse(remoteVersionNumbers[i]) * 10;
//     }
//     if (i == 2) {
//       localVersionSum += int.parse(localVersionNumbers[i]) * 1;
//       remoteVersionSum += int.parse(remoteVersionNumbers[i]) * 1;
//     }
//   }

//   return localVersionSum >= remoteVersionSum;
// }
