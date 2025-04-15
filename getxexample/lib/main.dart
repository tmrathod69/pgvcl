import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getxexample/secondscreen.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';
import 'homescreen.dart';

void main()
{
  runApp
    (
      MultiProvider
        (
          providers:
        [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
        ],child: MyApp()),);

}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp
      (
        title: 'GetX + Provider',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages:
        [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/second', page: () => SecondScreen()),
      ],
      );
  }

}
