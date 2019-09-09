import 'package:flutter/material.dart';

mixin TextUtils {
  Color computeTextColor(Color background) {
    return background.computeLuminance() >= 0.5
        ? Colors.black
        : Colors.white;
  }
}