import 'dart:async';
import 'dart:io';
import 'package:bloc22/loginscreen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyAnimState();
}

class _MyAnimState extends State<SplashScreen>
{
  @override
  void initState()
  {
    checkconnection();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body:Center
          (
          child: Lottie.asset('assets/abc.json'),
        )
    );
  }

  void checkconnection()async
  {
    var connectivityresult = await Connectivity().checkConnectivity();

    if(connectivityresult.contains(ConnectivityResult.mobile))
    {
      Timer(Duration(seconds: 3),
              ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
    else if(connectivityresult.contains(ConnectivityResult.wifi))
    {
      Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
    else
    {
      networkerrordialog();
    }

  }

  networkerrordialog()async
  {
    return showDialog
      (
        context: context,
        builder:(BuildContext context)
        {
          return AlertDialog
            (
            icon: Icon(Icons.error),
            backgroundColor: Colors.blueGrey,
            title: Text("\n Network Error"),
            actions:
            [
              ElevatedButton(onPressed: ()
              {

                //Navigator.pop(context);
                exit(0);
              }, child: Text("OK"))
            ],
          );
        }
    );
  }
}
