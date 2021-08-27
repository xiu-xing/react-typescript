import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 弹窗condition及其组件中用到的常量
class Const {
  static final int columnCount = 3;
  static final int rowLimit = 4;
  static final double actionsHeight = 48.0;
  static final double cellHeight = 32.w;
  static final String startHint = "开始值";
  static final String endHint = "结束值";
  static final String startDateHint = "开始时间";
  static final String endDateHint = "结束时间";
  static final double leftMargin = 24.w;
  static final double rightMargin = 21.w;
  static final double spacing = 12.w;
  static final String datePickerTypeYear = "year";
  static final String datePickerTypeDate = "date";
  static final String sourceTypeNumber = "number";
  static final String sourceTypeDatePicker = "date_picker";
  static final String sourceTypeString = "string";
  // 504 in 667
  static final double conditionHeight = (504 / 667).sh;

  // 如果要固定GridView item高度为32.w 则宽高比应如下计算
  // childAspectRatio = (width - allSpace)/3 / 32.w
  static final double childAspectRatio =
      (1.sw - leftMargin - rightMargin - 2 * spacing) / 3 / cellHeight;

  Const() {
    print("childAspectRatio = $childAspectRatio");
  }
}
