import 'package:flutter/material.dart';

import 'package:pr1/custom_track_shape.dart';
import 'package:pr1/screen_utils.dart';

class LandscapeLayout extends StatefulWidget {
  LandscapeLayout({Key key}) : super(key: key);

  @override
  _LandscapeLayoutState createState() => _LandscapeLayoutState();
}

class _LandscapeLayoutState extends State<LandscapeLayout> with ScreenUtils {
  int _a = 255;
  int _r = 67;
  int _g = 85;
  int _b = 172;

  set r(int val) => setState(() => _r = val);
  set g(int val) => setState(() => _g = val);
  set b(int val) => setState(() => _b = val);

  Color get color {
    return Color.fromARGB(_a, _r, _g, _b);
  }

  String get hexColor {
    padHex(int x) => x.toRadixString(16).padLeft(2, '0');
    return "#${padHex(_r)}${padHex(_g)}${padHex(_b)}";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildColorPanel(),
        _buildSliderPanel(),
      ],
    );
  }

  Widget _buildColorPanel() {
    final textColor = color.computeLuminance() >= 0.5 ? Colors.black : Colors.white;

    return Expanded(
      child: Container(
        color: color,
        child: Center(
          child: Text(hexColor,
            style: Theme.of(context)
                .textTheme
                .display2
                .apply(color: textColor),
          ),
        ),
      ),
    );
  }

  Widget _buildSliderPanel() {
    return Container(
      width: screenWidth(context, dividedBy: 3),
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSliderRow(get: () => _r, set: (x) => _r = x, activeColor: Colors.red),
          _buildSliderRow(get: () => _g, set: (x) => _g = x, activeColor: Colors.green),
          _buildSliderRow(get: () => _b, set: (x) => _b = x, activeColor: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildSlider({int Function() get, Function(int) set, Color activeColor}) {
    return SliderTheme(
      data: SliderThemeData(
        trackShape: CustomTrackShape(),
      ),
      child: Slider(
        min: 0.0,
        max: 255.0,
        value: get().toDouble(),
        onChanged: (double x) => setState(() => set(x.toInt())),
        activeColor: activeColor,
      ),
    );
  }

  Widget _buildSliderRow({int Function() get, Function(int) set, Color activeColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          width: 35,
          margin: EdgeInsets.only(right: 15),
          child: Text(get().toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: _buildSlider(get: get, set: set, activeColor: activeColor),
        ),
      ],
    );
  }
}
