import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ColorBloc {
  static final defaultColor = Color.fromARGB(0xff, 0x66, 0xe2, 0xb9);

  BehaviorSubject<int> _rSubject = new BehaviorSubject<int>();
  BehaviorSubject<int> _gSubject = new BehaviorSubject<int>();
  BehaviorSubject<int> _bSubject = new BehaviorSubject<int>();

  ValueObservable<int> _r;
  ValueObservable<int> _g;
  ValueObservable<int> _b;

  ValueObservable<int> get r => _r;
  ValueObservable<int> get g => _g;
  ValueObservable<int> get b => _b;

  ValueObservable<Color> color;

  ColorBloc() {
    _r = _rSubject.stream.shareValueSeeded(defaultColor.red);
    _g = _gSubject.stream.shareValueSeeded(defaultColor.green);
    _b = _bSubject.stream.shareValueSeeded(defaultColor.blue);

    color = Observable.combineLatest3(r, g, b,
      (red, green, blue) => Color.fromARGB(0xff, red, green, blue),
    ).shareValueSeeded(defaultColor);
  }

  updateRedComponent(int r) {
    _rSubject.value = r;
  }

  updateGreenComponent(int g) {
    _gSubject.value = g;
  }

  updateBlueComponent(int b) {
    _bSubject.value = b;
  }

  dispose() {
    _rSubject.close();
    _gSubject.close();
    _bSubject.close();
  }
}
