import 'package:flutter/material.dart';

class ThemChanger with ChangeNotifier {
  var _themMode = ThemeMode.light;
  ThemeMode get themMode => _themMode;

  void setThem(themMode) {
    _themMode = themMode;
    notifyListeners();
  }
}
