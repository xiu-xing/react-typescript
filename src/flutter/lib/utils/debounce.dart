import 'dart:async';

Timer? _debounce;

Function debounce(Function fn, [int t = 30]) {
  return () {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(Duration(milliseconds: t), () {
      fn();
    });
  };
}
