import 'package:flutter/material.dart';

mixin ScreenUtils {
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    final reducedBy = kToolbarHeight + kBottomNavigationBarHeight;
    return (screenSize(context).height - reducedBy) / dividedBy;
  }
}
