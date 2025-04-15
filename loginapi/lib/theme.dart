import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  // Primary color used throughout the app
  primaryColor: Colors.blue,

  // Scaffold background color
  scaffoldBackgroundColor: Color(0xFFF1F3F6),

  // AppBar theme
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),

  // Text theme
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.black54),
    headline6: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
  ),

  // Button theme
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    padding: EdgeInsets.symmetric(vertical: 15.0),
  ),

  // Input decoration theme for text fields
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
  ),
);