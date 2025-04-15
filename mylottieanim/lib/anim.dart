import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'nextpage.dart';

class MyAnim extends StatefulWidget {
  const MyAnim({super.key});

  @override
  State<MyAnim> createState() => _MyAnimState();
}

class _MyAnimState extends State<MyAnim> {
  @override
  void initState()
  {
    checkconnection();
//    Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage())));

  }

  Widget build(BuildContext context) {
    return Scaffold
      (
        body: Center
          (
            child:Lottie.asset('assets/abc.json'),
          )
      );
  }

  void checkconnection()async
  {
    var result= await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.mobile)
    {
      Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage())));
    }
    else if(result == ConnectivityResult.wifi)
    {
      Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage())));
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
                   //Navigator.pop(context);
                   exit(0);
                  },
                  child: Text("OK"))
              ],
            );
        }
      );
  }
}

