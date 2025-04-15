import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

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

      localizationsDelegates:
      [
        S.delegate,  // This is the generated localization delegate.
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:
      [
        Locale('hi', ''), // English
        Locale('en', ''), // Hindi
      ],
      locale: Locale('hi',''),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text(S.of(context).title),),
      body: Center
        (
//        child: Text(S.of(context).message,style: TextStyle(fontSize: 20.00),),
          child: Column
            (
               children:
               [
                 Text(S.of(context).message,style: TextStyle(fontSize: 20.00),),
                 Text(S.of(context).detail,style: TextStyle(fontSize: 15.00),),
               ]

           ),
      ),
    );
  }
}