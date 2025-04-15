import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController email= TextEditingController();
  TextEditingController pass= TextEditingController();

  @override
  Widget build(BuildContext context)
  {
      return Scaffold
        (
           body: Center
             (
               child: Padding
                 (
                    padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
                    child: Column
                      (
                        children:
                        [
                          Image.network("https://media.istockphoto.com/id/2065674519/photo/rolling-says-macro.jpg?s=1024x1024&w=is&k=20&c=ZRzdKZTGsNQqzQ4HpvVsrWT1BL9NjKmB76pIteut-xs=",width:100,height:100),
                          TextField
                            (
                            controller: email,
                            decoration: InputDecoration
                              (
                                labelText: "eMail",
                            ),
                          ),
                          TextField
                            (
                            controller: pass,
                            decoration: InputDecoration
                              (
                                labelText: "Password"
                              ),
                          ),
                          ElevatedButton
                            (
                              onPressed:()
                              {
                              },
                              child: Text("Login"))
                        ]
                    )

                )
           )
      );
  }
}
