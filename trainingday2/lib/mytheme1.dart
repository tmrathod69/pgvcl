import 'package:flutter/material.dart';
import 'package:trainingday2/theme.dart';

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  bool _isDarkMode = false;

  void toggleTheme()
  {
    setState(() {

      _isDarkMode = !_isDarkMode;

    });

  }


  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Theme and Style',
      theme:AppTheme.lighttheme,
      darkTheme:AppTheme.darktheme,
      home: ThemeSwitcherScreen
        (
        isDarkMode: _isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}
class ThemeSwitcherScreen extends StatelessWidget
{
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  ThemeSwitcherScreen({required this.isDarkMode,required this.toggleTheme });

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text('light and dark theme'),
      ),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            CircleAvatar(backgroundImage:AssetImage('images/a.jpg'),),
            SizedBox(height: 10),
            Text
              (
              'Tops',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              'Flutter Developer',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: ()
            {
              toggleTheme();

            }, child: Text(isDarkMode ? 'Switch to Light Theme' : 'Switch to Dark Theme'),
              //optional
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            )
          ],
        ),
      ),
    );
  }



}