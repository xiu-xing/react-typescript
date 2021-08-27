import 'package:flutter/material.dart';

class TrackerEntityProvider extends ChangeNotifier {
  int _enterpriseCount = 0;
  int _institutionCount = 0;
  int _verticalCount = 0;

  int get enterpriseCount => this._enterpriseCount;
  int get institutionCount => this._institutionCount;
  int get verticalCount => this._verticalCount;

  void setEntierpriseCount(int value) {
    this._enterpriseCount = value;
    notifyListeners();
  }

  void setInstitutionCount(int value) {
    this._institutionCount = value;
    notifyListeners();
  }

  void setVerticalCount(int value) {
    this._verticalCount = value;
    notifyListeners();
  }
}
