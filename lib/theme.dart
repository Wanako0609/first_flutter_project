import 'package:flutter/material.dart';

class MyTheme {
  final ThemeData theme1 = ThemeData(
    fontFamily: "OpenSans",
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF96ADC8)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: const Color(0xFF3D5A80)),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    ),
  );
}
