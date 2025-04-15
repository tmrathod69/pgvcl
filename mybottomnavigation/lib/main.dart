import 'package:flutter/material.dart';
import 'package:mybottomnavigation/navigation.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
        home: MyBottomNav(),
      );
  }
}
