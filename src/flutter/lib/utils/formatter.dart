import 'package:jiffy/jiffy.dart';
import 'package:rime_app/models/rich_text/rich_text.dart';

class Formatter {
  static List<RichTextModel> toRichText(List<dynamic>? text) {
    if (text == null) {
      return List.empty();
    }
    List<RichTextModel> result = [];
    text.forEach((e) {
      result.add(RichTextModel.fromJson(e));
    });
    return result;
  }

  static String stringToLocale(String value) {
    int valueLen = value.length;
    int i = valueLen % 3;
    if (valueLen <= 3) {
      return value;
    } else {
      var mod = valueLen % 3;
      var output = (mod == 0 ? '' : (value.substring(0, mod)));
      var temp;
      if (mod == 0) {
        temp = (valueLen / 3);
      } else {
        temp = (valueLen / 3) - 1;
      }
      for (i = 0; i < temp; i++) {
        if ((mod == 0) && (i == 0))
          output += value.substring(mod + 3 * i, mod + 3 * i + 3);
        else
          output += ',' + value.substring(mod + 3 * i, mod + 3 * i + 3);
      }
      return (output);
    }
  }

  static bool isPassword(String psw) {
    if (psw == "") return false;
    String pswRegexp = r'^\w{8,}$';
    RegExp regExp = new RegExp(pswRegexp);

    return regExp.hasMatch(psw);
  }

  static bool isPhone(String? phone) {
    if (phone == null || phone == "") return false;
    String phoneRegexp =
        r'^[1]([3-9])[0-9]{9}$|^([6|9])\d{7}$|^[0][9]\d{8}$|^[6]([8|6])\d{5}$';
    RegExp regExp = new RegExp(phoneRegexp);

    return regExp.hasMatch(phone);
  }

  static bool isEmail(String email) {
    if (email == "") return false;
    String emailRegexp =
        r'''[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?''';
    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(email);
  }

  static bool isCaptcha(String captcha) {
    if (captcha == "") return false;
    String catpchaRegexp = r'^[0-9]{6}$';
    RegExp regExp = new RegExp(catpchaRegexp);

    return regExp.hasMatch(captcha);
  }

  static String formatTimeStamp(int timeStamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String dateString = date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString();
    return dateString;
  }

  static String timeFromNow(int timeStamp) {
    return Jiffy(DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000)
            .toString()
            .substring(0, 10))
        .fromNow();
  }

  // 计算时间差
  static String calTimeDif(int timeStamp,
      {String? placeholder, bool? ignoreYear}) {
    var year = DateTime.now().year;
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    var today = new DateTime(year, month, day);
    var nowDate = DateTime.now();

    var inputDate = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var currentTimeDiff = nowDate.difference(inputDate);
    var timeDif = inputDate.difference(today);
    if (timeDif.inDays < -1) {
      if (placeholder != null) {
        return ((ignoreYear ?? false)
                ? ''
                : (inputDate.year.toString() + placeholder)) +
            inputDate.month.toString() +
            placeholder +
            inputDate.day.toString();
      }
      return inputDate.month.toString() +
          ' 月 ' +
          inputDate.day.toString() +
          ' 日';
    }
    if (timeDif.inHours < 0 && timeDif.inHours > -24) {
      return "昨天";
    }
    if (currentTimeDiff.inHours >= 1 && currentTimeDiff.inHours <= 24) {
      return currentTimeDiff.inHours.toString() + " 小时前";
    }
    if (currentTimeDiff.inMinutes >= 1 && currentTimeDiff.inMinutes <= 60) {
      return currentTimeDiff.inMinutes.toString() + " 分钟前";
    }
    if (currentTimeDiff.inSeconds >= 0 && currentTimeDiff.inSeconds <= 60) {
      return currentTimeDiff.inSeconds.toString() + " 秒前";
    }
    if (placeholder != null) {
      return ((ignoreYear ?? false)
              ? ''
              : (inputDate.year.toString() + placeholder)) +
          inputDate.month.toString() +
          placeholder +
          inputDate.day.toString();
    }
    return (ignoreYear ?? false)
        ? ''
        : (inputDate.year.toString() + '年') +
            inputDate.month.toString() +
            ' 月 ' +
            inputDate.day.toString() +
            ' 日';
  }

  static String breakText(String text) {
    if (text.isEmpty) return text;
    String newText = '';
    text.runes.forEach((element) {
      newText += String.fromCharCode(element);
      newText += '\u200B';
    });
    return newText;
  }

  static String getShareUrl(String? link) {
    if (link == null) return "";

    if (link.startsWith("rimedata://rimedata")) {
      final innerLink = link.replaceAll("rimedata://rimedata", "");

      if (innerLink != "") return innerLink;

      return "";
    }

    return "";
  }

  static String getShareUniUrl(String? link) {
    if (link == null) return "";

    List<String> strs = link.split("share?");

    if (strs.length == 2) {
      return "/" + strs.last;
    }

    return "";
  }
}
