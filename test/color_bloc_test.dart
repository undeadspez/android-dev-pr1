import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

import 'package:pr1/color_bloc.dart';

void main() {

  test('First value should bot be null', () async {
    final subject = new BehaviorSubject<int>();
    final observable = subject.shareValueSeeded(1);

    expect(observable.value, isNotNull);

    subject.close();
  });

  test('Color should not be null', () async {
    final colorBloc = ColorBloc();

    expect(colorBloc.r.value, isNotNull);

    colorBloc.dispose();
  });

  testWidgets('Should run without exceptions', (WidgetTester tester) async {
    final colorBloc = ColorBloc();

    debugPrint('Red: ${colorBloc.r.value}');

    final sb = StreamBuilder<int>(
      initialData: colorBloc.r.value,
      builder: (context, snapshot) {
        debugPrint('hasData: ${snapshot.hasData}');
        debugPrint('hasError: ${snapshot.hasError}');

        return Slider(
          min: 0.0,
          max: 255.0,
          value: snapshot.data.toDouble(),
          onChanged: (x) {},
        );
      },
    );

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: sb)));
    expect(tester, isNotNull);

    colorBloc.dispose();
  });
}
