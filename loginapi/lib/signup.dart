import 'package:flutter/material.dart';
import 'package:loginapi/main.dart';
import 'package:loginapi/theme.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget
{


  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
{

  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

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
                TextField(controller:fname,decoration:InputDecoration
                  (
                    labelText: 'Firstname',
                    hintText: 'Enter your Firstname',
                    prefixIcon:Icon(Icons.person)
                )
                ),
                SizedBox(height: 20),

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

                  String firstname1 = fname.text.toString();
                  String email1 = email.text.toString();
                  String pass1 = pass.text.toString();
                  insertdata(firstname1,email1,pass1);
                  //print("Inserted");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserted")));
                  fname.clear();
                  email.clear();
                  pass.clear();
                  Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                }, child: Text("Signup")),
                TextButton(onPressed: ()
                {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()));
                }, child: Text("Already have an account?"))



              ],
            ),
          ),
        ));
  }

  void insertdata(var fname,var email,var pass)
  {
    var url = Uri.parse("https://prakrutitech.buzz/Fluttertestapi/signup.php");
    var resp = http.post(url,body:
    {
      "firstname":fname,
      "email":email,
      "password":pass
    });
    print("Response: ${resp.toString()}");


  }
}