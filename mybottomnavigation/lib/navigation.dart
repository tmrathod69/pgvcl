import 'package:flutter/material.dart';
import 'package:mybottomnavigation/firstpage.dart';

import 'package:mybottomnavigation/thirdpage.dart';

import 'secondpage.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _selectedindex=0;
  static List <Widget> mypages=
  [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  @override
  Widget build(BuildContext context)
  {
     return Scaffold
       (
          appBar: AppBar(title:Text('Bottom Navigation Example'),),
          body: mypages[_selectedindex],
          bottomNavigationBar: BottomNavigationBar
          ( backgroundColor: Colors.amber,
            items:
          [
            BottomNavigationBarItem
            (
             icon: Icon(Icons.add),
             label: "First",
            ),
            BottomNavigationBarItem
              (
                icon: Icon(Icons.home),
                label: "Second",
            ),
            BottomNavigationBarItem
              (
                icon: Icon(Icons.home),
                label: "Third",
            )

          ],
            selectedItemColor: Colors.red,
            iconSize: 40.00,
            elevation: 5,
            currentIndex: _selectedindex,
            onTap: _tap1,
         ),
       );
  }

  _tap1(int index)
  {
    setState(()
    {
      _selectedindex=index;
    });
  }
}

