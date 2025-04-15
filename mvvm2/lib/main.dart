import 'package:day1022/views/home_screen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: HomeScreen());
  }
}

