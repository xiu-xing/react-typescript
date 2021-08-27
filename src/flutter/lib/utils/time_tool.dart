class TimeTool {
  static int getTodayTimeStamp() {
    var year = DateTime.now().year;
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    var today = new DateTime(year, month, day);
    return (today.millisecondsSinceEpoch / 1000).round();
  }

  static int getYesterdayTimeStamp() {
    var year = DateTime.now().year;
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    var yesterday = new DateTime(year, month, day - 1);
    return (yesterday.millisecondsSinceEpoch / 1000).round();
  }

  static int get7DaysTimeStamp() {
    var year = DateTime.now().year;
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    var sevenDays = new DateTime(year, month, day - 7);
    return (sevenDays.millisecondsSinceEpoch / 1000).round();
  }

  static int get30daysTimeStamp() {
    var year = DateTime.now().year;
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    var lastMonth = new DateTime(year, month - 1, day);
    return (lastMonth.millisecondsSinceEpoch / 1000).round();
  }

  static int get3MothsTimeStamp() {
    var year = DateTime.now().year;
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    var lastMonth = new DateTime(year, month - 3, day);
    return (lastMonth.millisecondsSinceEpoch / 1000).round();
  }

  static int get6MonthsTimeStamp() {
    var year = DateTime.now().year;
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    var lastMonth = new DateTime(year, month - 6, day);
    return (lastMonth.millisecondsSinceEpoch / 1000).round();
  }

  static DateTime after({int? year}) {
    var curYear = DateTime.now().year;
    var curMonth = DateTime.now().month;
    var curDay = DateTime.now().day;
    var max = new DateTime(curYear + (year ?? 0), curMonth, curDay);
    return max;
  }

  static DateTime afterFromString(String dateTimeStr) {
    return DateTime.parse(dateTimeStr);
  }

  static String getDateOfMonth(int month) {
    switch (month) {
      case 2:
        return '29';
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return '31';
      default:
        return '30';
    }
  }
}
//1,3,5,7,8,10,12:
