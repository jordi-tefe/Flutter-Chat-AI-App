import 'package:flutter/material.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 26.0;
  static const smallstralarge = 22.0;
}

ThemeData LightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.white,
  ),
  colorScheme: ColorScheme.light(
      background: Color(0xffffffff),
      primary: Color(0xff3369ff),
      secondary: Color(0xffffffff)),
  inputDecorationTheme:
      InputDecorationTheme(labelStyle: TextStyle(color: Colors.blue)),
  textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xffffffff)),
      titleMedium:
          TextStyle(color: Color(0xff000000), fontSize: FontSizes.smallstralarge),
      titleSmall: TextStyle(color: Color(0xffffffff)),
      bodyMedium:
          TextStyle(color: Color(0xffEEEEEE), fontSize: FontSizes.small),
      bodySmall:
          TextStyle(color: Color(0xff000000), fontSize: FontSizes.small)),
);

ThemeData DarkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Color.fromARGB(113, 0, 0, 0),
      primary: Color(0xff3369ff),
      secondary: Color(0xffffffff)),
  textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xffEEEEEE),
      ),
      titleSmall: TextStyle(
        color: Color(0xff000000),
      ),
      bodyMedium:
          TextStyle(color: Color(0xffEEEEEE), fontSize: FontSizes.small),
      bodySmall:
          TextStyle(color: Color(0xff000000), fontSize: FontSizes.small)),
);
