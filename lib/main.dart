import 'package:flutter/material.dart';
import 'layouts/portrait_layout.dart';
import 'layouts/landscape_layout.dart';

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
        body: HomePage()
      )
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait
          ? PortraitLayout()
          : LandscapeLayout();
      }
    );
  }
}
