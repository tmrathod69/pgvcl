
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  String _languageCode = 'en';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSavedLanguage();
  }

  Future<void> _getSavedLanguage()async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _languageCode = prefs.getString('language') ?? 'en'; // Default to English
    });
  }

  Future<void> _setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    setState(() {
      _languageCode = languageCode;  // Update the language code in state
    });
  }


  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (

      locale: Locale(_languageCode),
      supportedLocales: [
        Locale('en', ''),
        Locale('hi', ''),
        Locale('gu', ''),
      ],
      localizationsDelegates: [
        S.delegate, // Generated localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LanguageSelectionScreen(onLanguageChanged: _setLanguage),
    );
  }


}
class LanguageSelectionScreen extends StatelessWidget
{
  final Function(String) onLanguageChanged;//effect1

  const LanguageSelectionScreen({super.key, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),  // Localized string for language prompt
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => _setLanguage(context, 'en'),  // Set language to English
            child: Text('English'),
          ),
          ElevatedButton(
            onPressed: () => _setLanguage(context, 'hi'),  // Set language to Hindi
            child: Text('Hindi'),
          ),
          ElevatedButton(
            onPressed: () => _setLanguage(context, 'gu'),  // Set language to Gujarati
            child: Text('Gujarati'),
          ),
        ],
      ),
    );
  }
  void _setLanguage(BuildContext context, String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    // Immediately update the language
    onLanguageChanged(languageCode);
    // Navigate to the next screen with the updated language
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TrafficRulesScreen()),
    );
  }
}


class TrafficRulesScreen  extends StatelessWidget
{
  const TrafficRulesScreen ({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text(S.of(context).languagePrompt),  // Localized title
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S.of(context).trafficRule1),  // Localized content for traffic rules
          Text(S.of(context).trafficRule2),
          Text(S.of(context).trafficRule3),
        ],
      ),
    );
  }
}

