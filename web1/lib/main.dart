import 'package:flutter/material.dart';

import 'button1.dart';
import 'formvalidation.dart';
import 'hover.dart';
import 'imagegallery.dart';

//flutter build web
void main()
{
  runApp(MyApp6());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Asset Image Demo',  // This title is used internally by Flutter
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class ImageHomePage extends StatefulWidget {
  @override
  _ImageHomePageState createState() => _ImageHomePageState();
}

class _ImageHomePageState extends State<ImageHomePage> {
  @override
  void initState() {
    super.initState();
    // This sets the browser tab title once the widget is created
    //html.document.title = 'My Custom Web Title';  // ✅ Correct title for the tab
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Web Image"),
      ),
      body: Center(
        child: Image.asset(
          'images/back1.jpg',  // Make sure the image path is correct
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}

