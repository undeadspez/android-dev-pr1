import 'package:flutter/material.dart';

import 'package:pr1/layouts/landscape_layout.dart';
import 'package:pr1/layouts/portrait_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'RGB color picker';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title)
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return orientation == Orientation.portrait
              ? PortraitLayout()
              : LandscapeLayout();
          },
        ),
      ),
    );
  }
}

