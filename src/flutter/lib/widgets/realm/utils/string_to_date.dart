import 'package:flutter/material.dart';

// year 2021->DateTime or 2021-06-11->DateTime
DateTime stringToDate(String dateString, DatePickerMode pickerMode) {
  if (DatePickerMode.year == pickerMode) {
    return DateTime(int.parse(dateString));
  } else {
    return DateTime.parse(dateString);
  }
}
