import 'package:flutter/material.dart';

mixin ScreenUtils {
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).width - reducedBy) / dividedBy;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).height - reducedBy) / dividedBy;
  }

  double effectiveScreenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenWidth(context, dividedBy: dividedBy);
  }

  double effectiveScreenHeight(BuildContext context, {double dividedBy = 1}) {
    var reducedBy = kToolbarHeight + kBottomNavigationBarHeight;
    return screenHeight(context, dividedBy: dividedBy, reducedBy: reducedBy);
  }
}
