import 'package:flutter/material.dart';
import 'package:shop/constants/font_family.dart';

class ThemeState {
  ThemeData _theme = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.deepOrange,
    fontFamily: FONT_FAMILY.LATO,
  );

  ThemeData get theme => this._theme;

  void setColors(MaterialColor primarySwatch, MaterialColor accentColor) {
    this._theme = ThemeData(
      primarySwatch: primarySwatch,
      accentColor: accentColor,
      fontFamily: FONT_FAMILY.LATO,
    );
  }

  bool diff(ThemeState old) {
    return old == null || old._theme != this.theme;
  }
}

class ThemeProvider extends InheritedWidget {
  final ThemeState state = ThemeState();

  ThemeProvider({
    Widget child,
  }) : super(child: child);

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
