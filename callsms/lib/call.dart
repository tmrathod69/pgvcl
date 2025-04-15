
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class CallEx extends StatefulWidget {
  const CallEx({super.key});

  @override
  State<CallEx> createState() => _CallExState();
}

class _CallExState extends State<CallEx>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Call & Sms"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            ElevatedButton(onPressed: ()
            {

              _makecall("1234567890");


            }, child: Text("Call")),
            ElevatedButton(onPressed: ()
            {

              _makesms("8849817263",'Hello! This is a test message.');
            }, child: Text("SMS")),

          ],
        ),
      ),
    );
  }

  void _makecall(String phoneNumber) async
  {
    final Uri launchUri = Uri
      (
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString()))
    {
      await launch(launchUri.toString());
    } else {
      throw 'Could not call $phoneNumber';
    }

  }

  void _makesms(String s, String t)async
  {
    final Uri smsUri = Uri
      (
      scheme: 'sms',
      path: s,
      queryParameters: {'body': t},
    );
    if (await canLaunch(smsUri.toString())) {
      await launch(smsUri.toString());
    } else {
      throw 'Could not send SMS to $s';
    }

  }


}
