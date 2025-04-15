import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? selectedLanguage = prefs.getString('language_code');
  runApp(MyApp( locale: selectedLanguage != null ? Locale(selectedLanguage) : Locale('en')));
}

class MyApp extends StatelessWidget
{
  Locale? locale;
  MyApp({required this.locale});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      locale: locale,
      supportedLocales:
      [
        Locale('en', ''), // English
        Locale('hi', ''), // Hindi
      ],
      localizationsDelegates:
      [
        S.delegate, // The generated localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
  String? _selectedLanguage;
  List<String> _languages = ['English', 'Hindi'];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(),
      body: Center
        (
        child: Column
          (
          children:
          [
            Text(
              S.of(context).message,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            DropdownButton
              (
                value:_selectedLanguage == 'en' ? 'English' : 'Hindi',
                items: _languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged:(newValue)
                {
                  setState(()
                  {
                    _updateLocale(newValue!);
                  });
                }
            )

          ],
        ),
      ),
    );
  }

  void _updateLocale(String language)
  {
    Locale locale;
    if (language == 'Hindi')
    {
      locale = Locale('hi');
      _saveLanguage('hi');
    }
    else
    {
      locale = Locale('en');
      _saveLanguage('en');
    }
    MyApp
      (
      locale: locale,
    );

  }

  _saveLanguage(String languageCode)async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language_code', languageCode);
    setState(() {
      _selectedLanguage = languageCode;
    });
  }
}