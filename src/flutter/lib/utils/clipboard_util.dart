import 'package:flutter/services.dart';

//将获取的粘贴板的内容进行比较，符合格式就返回
@Deprecated(
  'This func will deprecated at next version',
)
Future<String> getClipboardDatas() async {
  var clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
  int now = new DateTime.now().year;
  RegExp regCode = new RegExp("^$now[\\w]{10}\$");
  RegExp regUrl = new RegExp(r"^https:\/\/rimedata\.com\/invitation\/");
  if (clipboardData != null) {
    String code = "";
    // 如果复制文本符合邀请链接 https://rimedata.wind.com.cn/invitation/
    if (regUrl.hasMatch(clipboardData.text ?? "")) {
      code = regUrl.firstMatch(clipboardData.text ?? "")?.group(1) ?? "";
    }
    // 或符合邀请码格式
    if (regCode.hasMatch(clipboardData.text ?? "")) {
      code = regCode.firstMatch(clipboardData.text ?? "")?.group(0) ?? "";
    }
    return code;
  }

  return "";
}
