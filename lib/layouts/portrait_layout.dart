import 'package:flutter/material.dart';

import 'package:pr1/color_bloc.dart';
import 'package:pr1/custom_slider.dart';
import 'package:pr1/screen_utils.dart';
import 'package:pr1/text_utils.dart';
import 'package:rxdart/rxdart.dart';

class PortraitLayout extends StatefulWidget {
  final ColorBloc colorBloc;

  PortraitLayout(this.colorBloc, {Key key}) : super(key: key);

  @override
  _PortraitLayoutState createState() => _PortraitLayoutState();
}

class _PortraitLayoutState extends State<PortraitLayout>
    with ScreenUtils, TextUtils {

  String getHexColor(Color color) {
    padHex(int x) => x.toRadixString(16).padLeft(2, '0');
    return '#' + padHex(color.red) + padHex(color.green) + padHex(color.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    return Expanded(
      child: StreamBuilder<Color>(
        initialData: widget.colorBloc.color.value,
        stream: widget.colorBloc.color,
        builder: (context, snapshot) {
          return Container(
            color: snapshot.data,
            child: Center(
              child: Text(
                getHexColor(snapshot.data),
                style: Theme
                    .of(context)
                    .textTheme
                    .display2
                    .apply(color: computeTextColor(snapshot.data)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSliderPanel() {
    return Container(
      height: screenHeight(context, dividedBy: 3),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSliderRow(
            colorComponent: widget.colorBloc.r,
            updateFunc: widget.colorBloc.updateRedComponent,
            activeColor: Colors.red,
          ),
          _buildSliderRow(
            colorComponent: widget.colorBloc.g,
            updateFunc: widget.colorBloc.updateGreenComponent,
            activeColor: Colors.green,
          ),
          _buildSliderRow(
            colorComponent: widget.colorBloc.b,
            updateFunc: widget.colorBloc.updateBlueComponent,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildSliderRow({
    @required ValueObservable<int> colorComponent,
    @required Function(int) updateFunc,
    @required Color activeColor,
  }) {
    return StreamBuilder<int>(
      initialData: colorComponent.value,
      stream: colorComponent,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: 35,
              margin: EdgeInsets.only(right: 15),
              child: Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: CustomSlider(
                min: 0.0,
                max: 255.0,
                value: snapshot.data.toDouble(),
                onChanged: (double x) => updateFunc(x.toInt()),
                activeColor: activeColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
