import 'package:flutter/material.dart';

class MyTheme {
  static final Color buttonColor = Color(0xff3598DB);
  static final ThemeData ligthTheme = ThemeData(
      buttonColor: buttonColor,
      textTheme: const TextTheme(
          headline3: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          color: Colors.transparent, elevation: 0, centerTitle: true));
}
