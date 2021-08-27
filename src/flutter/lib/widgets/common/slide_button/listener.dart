import 'package:flutter/material.dart';

class SlideButtonListener {
  factory SlideButtonListener() => _getInstance()!;
  static SlideButtonListener? get instance => _getInstance();
  static SlideButtonListener? _instance;
  SlideButtonListener._internal() {
    //
  }
  static SlideButtonListener? _getInstance() {
    if (_instance == null) {
      _instance = new SlideButtonListener._internal();
    }
    return _instance;
  }

  Map<LeftScrollCloseTag?, Map<Key?, LeftScrollStatus>> map = {};

  bool removeListener(LeftScrollCloseTag tag) {
    if (map[tag] != null) {
      map.remove(tag);
      return true;
    }
    return false;
  }

  LeftScrollStatus? targetStatus(LeftScrollCloseTag tag, Key key) =>
      map[tag]![key];

  needCloseOtherRowOfTag(LeftScrollCloseTag? tag, Key? key) {
    if (tag == null) {
      return;
    }
    if (map[tag] == null) {
      return;
    }
    for (var otherKey in map[tag]!.keys) {
      if (otherKey == key) {
        continue;
      }
      if (map[tag]![otherKey]!.value == true) {
        map[tag]![otherKey]!.value = false;
      }
    }
  }
}

class LeftScrollCloseTag {
  final String tag;
  LeftScrollCloseTag(this.tag);

  @override
  int get hashCode => tag.hashCode;

  operator ==(dynamic other) {
    if (other is LeftScrollCloseTag) {
      if (other.tag == tag) {
        return true;
      }
    }
    return false;
  }
}

class LeftScrollStatus extends ValueNotifier<bool> {
  LeftScrollStatus() : super(false);
  bool get isClose => value;
  bool get isOpen => !value;
}
