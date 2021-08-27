import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    Key? key,
    this.allSteps = 0,
    this.activeStep = 0,
  })  : assert(activeStep >= 0 && activeStep <= allSteps),
        super(key: key);

  final int activeStep;
  final int allSteps;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  void initState() {
    super.initState();
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isAfterCurrent(int index) {
    return widget.activeStep >= index;
  }

  bool _isCurrent(int index) {
    return widget.activeStep == index;
  }

  Widget _buildIcon(int index) {
    if (_isCurrent(index))
      return Container(
        height: 16.w,
        width: 16.w,
        padding: EdgeInsets.all(4.0),
        child: Center(
          child: Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(4.0.w),
            ),
          ),
        ),
      );

    if (!_isAfterCurrent(index))
      return Container(
        height: 16.w,
        width: 16.w,
        padding: EdgeInsets.all(4.0.w),
        child: Center(
          child: Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: _isAfterCurrent(index)
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(4.0.w),
            ),
          ),
        ),
      );

    return Icon(
      MdiIcons.check,
      color: Theme.of(context).primaryColor,
      size: 16.sp,
    );
  }

  Widget _buildLine(int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0.w),
        height: 1.0.h,
        color: _isAfterCurrent(index)
            ? Theme.of(context).primaryColor
            : Colors.grey.shade400,
      ),
    );
  }

  List<Widget> _buildSteps() {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.allSteps; i += 1) ...<Widget>[
        if (!_isFirst(i)) _buildLine(i),
        _buildIcon(i),
      ]
    ];

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildSteps(),
    );
  }
}
