import 'package:flutter/material.dart';
import 'package:shop/constants/font_family.dart';

ThemeData DEFAULT_THEME = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.deepOrange,
  fontFamily: FONT_FAMILY.LATO,
);

class DynamicTheme with ChangeNotifier {
  ThemeData _theme = DEFAULT_THEME;

  ThemeData get theme => _theme;

  void setDefaultTheme() {
    _theme = DEFAULT_THEME;
    notifyListeners();
  }

  void setDarkTheme() {
    _theme = ThemeData.dark();
    notifyListeners();
  }
}
