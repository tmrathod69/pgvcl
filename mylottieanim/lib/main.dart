
import 'package:flutter/material.dart';
import 'package:mylottieanim/anim.dart';
import 'package:mylottieanim/animtrans.dart';

import 'blinkscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:HomePage());
  }
}
