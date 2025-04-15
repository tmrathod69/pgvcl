
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapi/listandgrid.dart';
import 'package:loginapi/signup.dart';
import 'package:loginapi/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';
void main()
{
  runApp(MaterialApp(home: MyApp7()));
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
        theme: appTheme,
        home:LoginPage()
    );
  }
}
class LoginPage extends StatefulWidget
{


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  late SharedPreferences sharedPreferences;
  late bool newuser;

  @override
  void initState()
  {
    // TODO: implement initState
    // super.initState();

    checklogin();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Login Page"),),
        body: SingleChildScrollView
          (
          child:Padding
            (
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                TextField(controller:email,decoration:InputDecoration
                  (
                    labelText: 'Email',
                    hintText: 'Enter your Email',
                    prefixIcon:Icon(Icons.email)
                ),
                ),
                SizedBox(height: 20,),
                TextField(controller:pass,
                  obscureText: true,
                  decoration:InputDecoration
                    (
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                      prefixIcon:Icon(Icons.lock)
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()
                {

                  String email1 = email.text.toString();
                  String pass1 = pass.text.toString();

                  sharedPreferences.setBool("MY_SESSION", false);
                  sharedPreferences.setString("MYEMAIL",email1);

                  login(email1,pass1);
                  //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardScreen()));

                }, child: Text("Login")),
                TextButton(onPressed: ()
                {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignupPage()));
                }, child: Text("Do you want to signup?"))



              ],
            ),
          ),
        ));
  }

  void login(var email,var pass)async
  {
    var url = Uri.parse("https://prakrutitech.buzz/Fluttertestapi/signin.php");
    var response = await http.post(url,body:
    {
      "email" : email,
      "password": pass
    });

    var data = json.decode(response.body);

    if(data==0)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Fail")));
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardScreen()));
    }

  }

  void checklogin()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('MY_SESSION') ?? true);

    if(newuser==false)
    {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardScreen()));
    }



  }
}
