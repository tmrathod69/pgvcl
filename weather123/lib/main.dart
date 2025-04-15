import 'package:flutter/material.dart';
import 'package:weather123/audiofile.dart';
import 'package:weather123/locationex.dart';
import 'package:weather123/weather1.dart';

import 'anim.dart';
import 'homepage2.dart';
import 'homepage3.dart';
import 'homepage4.dart';

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
    return MaterialApp
      (
        home:MyAnim()

    );
  }
}