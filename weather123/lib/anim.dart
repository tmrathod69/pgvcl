import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:weather123/homepage4.dart';

class MyAnim extends StatefulWidget {
  const MyAnim({super.key});

  @override
  State<MyAnim> createState() => _MyAnimState();
}

class _MyAnimState extends State<MyAnim> {
  @override
  void initState()
  {
    super.initState();
    checkconnection();
//    Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage())));

  }

  Widget build(BuildContext context) {
    return Scaffold
      (
        body: Center
          (
            child: Lottie.asset('assets/abc.json'),
          )
      );
  }

  void checkconnection() async
  {
    var result= await Connectivity().checkConnectivity();
    if(ConnectivityResult.mobile)
    {
      Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage4())));
    }
    else if(ConnectivityResult.wifi)
    {
      Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage4())));
    }
    else
    {
      networkerrordialog();
    }

  }

  networkerrordialog() async
  {
    return showDialog
      (
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog
            (
               title: Text("\n network Error"),
               actions:
              [
                ElevatedButton
                  (onPressed: ()
                  {
                   Navigator.pop(context);
                  },
                  child: Text("OK"))
              ],
            );
        }
      );
  }
}
