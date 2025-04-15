import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loginapi/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget
{
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
{
  late SharedPreferences sharedPreferences;
  var email;
  @override
  void initState()
  {
    // TODO: implement initState
    checklogin2();
  }
  // @override
  // void didChangeDependencies()
  // {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Welcome $email"),actions:
    [
      IconButton(onPressed: ()
      {
        //exit(0);
        sharedPreferences.clear();
        sharedPreferences.setBool("MY_SESSION",true);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()));
      }, icon: Icon(Icons.logout))
    ],),);
  }



  void checklogin2()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(()
    {

      email = sharedPreferences.getString('MYEMAIL')!;

    });
  }
}