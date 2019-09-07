import 'package:flutter/material.dart';

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx + 20;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 40;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
