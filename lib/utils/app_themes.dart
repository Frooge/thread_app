import 'package:flutter/material.dart';

class AppThemes{
  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey.shade900
    );
  }

  ThemeData ligthTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white
    );
  }
}