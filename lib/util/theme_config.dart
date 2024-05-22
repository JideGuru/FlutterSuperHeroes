import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.grey.shade100;
  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightAccent = const Color(0xffd8242a);
  static Color darkAccent = const Color(0xffd8242a);
  static Color lightBG = Colors.grey.shade100;
  static Color darkBG = const Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: lightBG,
      foregroundColor: darkPrimary,
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: lightAccent),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccent),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: darkBG,
      foregroundColor: lightPrimary,
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: darkAccent),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: darkAccent,
      brightness: Brightness.dark,
    ),
  );
}
