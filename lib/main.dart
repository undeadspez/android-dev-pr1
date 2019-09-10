import 'package:flutter/material.dart';

import 'package:pr1/color_bloc.dart';
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
          title: Text(title),
        ),
        body: MyHomePage(title),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc colorBloc;

  @override
  void initState() {
    colorBloc = ColorBloc();
    super.initState();
  }

  @override
  void dispose() {
    colorBloc.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? PortraitLayout(this.colorBloc)
            : LandscapeLayout(this.colorBloc);
      },
    );
  }
}
