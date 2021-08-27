import 'dart:io';

import 'package:flutter/material.dart';

class CustomScrollBehavior extends ScrollBehavior {
  final ScrollController controller = ScrollController();
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildOverscrollIndicator(context, child,
          ScrollableDetails(controller: controller, direction: axisDirection));
    }
  }
}

extension CustomBehavior on Widget {
  removeHighlightColor() {
    if (Platform.isAndroid)
      return ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: this,
      );
    return this;
  }
}
