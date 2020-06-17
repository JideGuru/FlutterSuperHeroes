import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.grey[100];
  static Color darkPrimary = Color(0xff1f1f1f);
  static Color lightAccent = Color(0xffd8242a);
  static Color darkAccent = Color(0xffd8242a);
  static Color lightBG = Colors.grey[100];
  static Color darkBG = Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );
}
