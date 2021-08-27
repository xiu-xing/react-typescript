import 'package:flutter/material.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/widgets/verification/widgets/count_down/count_donw_notifier.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme.dart';

class CountDown extends StatefulWidget {
  CountDown({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startCountDown() {
    Global.countDownNotifier.startCountDown();
    if (widget.onTap != null) widget.onTap!();
  }

  Widget _buildButton(CountDownNotifier notifier) {
    if (notifier.firstRun || notifier.isFinished) {
      return GestureDetector(
          onTap: () => _startCountDown(),
          child: Text(
            "获取验证码",
            style: TextStyle(
              fontFamily: notoSansSC,
              color: Theme.of(context).primaryColor,
              fontSize: 14.sp,
            ),
          ));
    }
    return Text(
      "${notifier.value} 秒后重新获取",
      style: TextStyle(
        fontSize: 14.sp,
        fontFamily: notoSansSC,
        color: Colors.grey.shade400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Global.countDownNotifier,
      builder: (context, value, child) {
        return _buildButton(Global.countDownNotifier);
      },
    );
  }
}
