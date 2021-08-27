import 'dart:async';

import 'package:flutter/material.dart';

class CountDownNotifier extends ValueNotifier<int> {
  late int max;

  CountDownNotifier(int duration) : super(0){
    max = duration;
  }

  Timer? _timer;

  bool _first = true;

  bool get firstRun => _first;
  bool get isFinished => value == 0;

  void startCountDown() {
    _first = false;

    reset();

    cancel();

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (value == 0) {
          timer.cancel();
        } else {
          value -= 1;
        }
      },
    );
  }

  void cancel() {
    if (_timer != null) _timer!.cancel();
    _timer = null;
  }

  void reset() {
    value = max;
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }
}
