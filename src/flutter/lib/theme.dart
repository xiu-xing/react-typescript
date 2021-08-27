import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pigment/pigment.dart';

final Color primaryColor = Pigment.fromString("#4F709B");
final Color regularColor = Pigment.fromString('#333333');
final Color normalColor = Pigment.fromString('#333333'); // 正常文本的颜色, 类似标题颜色.
final Color highlightColor = primaryColor; // 高亮的颜色.
final Color highlightColorWithOpacity =
    Pigment.fromString('#668C9DFF').withOpacity(0.2); // 主题颜色带透明度
final Color disabledColor = Pigment.fromString('#999999'); // 灰度的颜色. 类似副标题的颜色.
final Color hintColor = Pigment.fromString('#666666'); // 中间灰度的颜色.
final Color dividerColor = Pigment.fromString('#E4E7EB');
final Color disabledButtonColor = Pigment.fromString('#CCCCCC'); // 按钮不可以点击的颜色.
final Color cancelTextColor = Pigment.fromString('#737373');
final Color errorColor = Pigment.fromString('#C62828'); // 错误颜色.
final Color secondaryColor = Pigment.fromString('#66778A'); //
final Color backgroundLightColor = Pigment.fromString('#F8F8F8'); // 浅灰色的背景
final Color backgroundDarkColor = Pigment.fromString('#F4F4F4'); // 深灰色的背景
final Color accountIconColor = Pigment.fromString('#DFDFDF');
final Color grey33 = Pigment.fromString('#333333');
final Color grey66 = Pigment.fromString('#666666');
final Color grey73 = Pigment.fromString('#737373');
final Color grey99 = Pigment.fromString('#999999');
final Color greyA6 = Pigment.fromString('#A6A6A6');
final Color greyEE = Pigment.fromString('#EEEEEE');
final Color greyCC = Pigment.fromString("#CCCCCC");
final Color deleteColor = Pigment.fromString('#F56161FF'); // 删除按钮背景颜色
final Color deleteColorWithOpactity =
    Pigment.fromString('#F56161FF').withOpacity(0.2);
final Color green7C = Pigment.fromString("#7CBE63");

final double lineHeight1_71 = 1.71;

const String notoSansSC = "NotoSansSC";

final TextStyle headline1 = TextStyle(
    fontSize: 18.sp,
    color: normalColor,
    fontFamily: notoSansSC,
    fontWeight: FontWeight.w500);
final TextStyle headline2 = TextStyle(
  fontSize: 16.sp,
  color: normalColor,
  fontFamily: notoSansSC,
);
final TextStyle headline3 = TextStyle(
  fontSize: 24.sp,
  color: normalColor,
  fontFamily: notoSansSC,
  fontWeight: FontWeight.w500,
);
final TextStyle headline4 = TextStyle(
  fontSize: 18.sp,
  color: normalColor,
  fontFamily: notoSansSC,
);
final TextStyle subtitle1 = TextStyle(
  fontSize: 16.sp,
  color: normalColor,
  fontFamily: notoSansSC,
);
final TextStyle bodyText1 = TextStyle(
  fontSize: 14.sp,
  color: normalColor,
  fontFamily: notoSansSC,
);
final TextStyle bodyText2 = TextStyle(
  fontSize: 12.sp,
  color: normalColor,
  fontFamily: notoSansSC,
);
// 比较大号的字体.
final TextStyle subtitle2 = TextStyle(
  fontSize: 12.sp,
  color: disabledColor,
  fontFamily: notoSansSC,
);
final TextStyle caption = TextStyle(
  fontSize: 14.sp,
  color: highlightColor,
  fontFamily: notoSansSC,
);
final TextStyle overline = TextStyle(
  fontSize: 20.sp,
  color: normalColor,
  fontFamily: notoSansSC,
);

// appbar style.
AppBarTheme appBarTheme = AppBarTheme(
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Pigment.fromString("#333333"),
      fontSize: 16,
      fontFamily: notoSansSC,
    ),
  ),
  color: Colors.white,
  brightness: Brightness.light,
  iconTheme: IconThemeData().copyWith(color: normalColor),
  actionsIconTheme: IconThemeData(
    color: Pigment.fromString('#333333'),
  ),
);

// the theme for the app. primarySwatch
final ThemeData theme = ThemeData(fontFamily: notoSansSC).copyWith(
  // textTheme: textTheme,
  appBarTheme: appBarTheme,
  dividerColor: dividerColor,
  iconTheme: IconThemeData().copyWith(color: secondaryColor),
  dividerTheme: DividerThemeData().copyWith(color: dividerColor, thickness: 1),
  colorScheme: ColorScheme(
    primary: primaryColor,
    primaryVariant: primaryColor.withOpacity(0.7),
    secondary: primaryColor.withOpacity(0.7),
    secondaryVariant: primaryColor.withOpacity(0.5),
    surface: Colors.white,
    background: Colors.white,
    error: errorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  primaryColor: primaryColor,
  accentColor: primaryColor.withOpacity(0.7),
  scaffoldBackgroundColor: Pigment.fromString('#FFF'),
);

/// Color to MaterialColor
MaterialColor colorToMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
