import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  double _currentValue = 1.0;
  double get currentValue => _currentValue;

  void setValue(double val) {
    _currentValue = val;
    notifyListeners();
  }
}
