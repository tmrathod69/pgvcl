import 'package:flutter/material.dart';

class AppTheme
{
  static final lighttheme = ThemeData
    (
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme
        (
        bodyText1: TextStyle(color: Colors.black, fontSize: 18),
      )

  );

  static final darktheme = ThemeData
    (
      brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.deepPurple,
        foregroundColor: Colors.black,
      ),
      textTheme: TextTheme
        (
        bodyText1: TextStyle(color: Colors.white, fontSize: 20),
      )

  );
}