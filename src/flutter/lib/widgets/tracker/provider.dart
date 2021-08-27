import 'package:flutter/material.dart';

class TrackerProvider extends ChangeNotifier {
  String _selectTag = "";

  String get selectTag => this._selectTag;

  void setSelectTag(String newTag) {
    this._selectTag = newTag;
    notifyListeners();
  }
}
