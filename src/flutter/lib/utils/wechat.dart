import 'package:fluwx/fluwx.dart';
import 'package:oktoast/oktoast.dart';

Future<bool> shareToWechat(
  String webPage, {
  String title = "",
  String? description,
  WeChatImage? thumbnail,
  WeChatScene scene = WeChatScene.SESSION,
  String? mediaTagName,
  String? messageAction,
  String? messageExt,
  bool compressThumbnail = true,
}) async {
  bool ok = await isWeChatInstalled;

  if (!ok) {
    showToast("请先安装微信");
    return false;
  }

  bool success = await shareToWeChat(
    WeChatShareWebPageModel(
      webPage,
      title: title,
      description: description,
      thumbnail: thumbnail,
      scene: scene,
      mediaTagName: mediaTagName,
      messageExt: messageExt,
      compressThumbnail: compressThumbnail,
    ),
  );

  return success;
}
