import 'package:flutter/material.dart';
import 'package:fooddelivery/themes/dark_mode.dart';
import 'package:fooddelivery/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  // Set theme based on switch value
  void toggleTheme({required bool value}) {
    _themeData = value ? darkMode : lightMode;
    notifyListeners();
  }
}
