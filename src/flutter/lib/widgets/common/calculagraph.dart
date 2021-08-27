import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';
import 'package:rime_app/theme.dart';

class Calculagraph extends StatefulWidget {
  Calculagraph({Key? key, this.onTap, this.disable = false}) : super(key: key);
  final VoidCallback? onTap;
  final bool disable;

  @override
  State<StatefulWidget> createState() => new _CalculagraphState();
}

class _CalculagraphState extends State<Calculagraph> {
  Timer? _timer;
  int _countdownTime = -1;
  bool isActive = false;
  String codeText = '获取验证码';
  static const duration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void handleTick() {
    if (isActive) {
      if (_countdownTime > 0) {
        setState(() => _countdownTime = _countdownTime - 1);
      }
      if (_countdownTime == 0) {
        setState(() => isActive = false);
      }
    }
  }

  void _sendCode() {
    if (widget.onTap == null) return;
    widget.onTap!();
    if (widget.disable) return;
    if (_countdownTime == -1 || _countdownTime == 0) {
      _countdownTime = 60;
      setState(() => isActive = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_timer == null) {
      _timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: !isActive ? _sendCode : null,
          borderRadius: new BorderRadius.circular(2.w),
          child: Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(vertical: 2.w),
            height: 26.h,
            child: Center(
              child: Text(
                _countdownTime > 0
                    ? '重新获取(${_countdownTime}s)'
                    : _countdownTime == 0
                        ? '重新发送'
                        : codeText,
                style: _countdownTime != 0 && _countdownTime != -1
                    ? bodyText1.copyWith(color: disabledButtonColor)
                    : bodyText1.copyWith(color: hintColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
