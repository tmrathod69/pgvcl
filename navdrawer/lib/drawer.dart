import 'package:flutter/material.dart';
import 'package:navdrawer/about.dart';
import 'package:navdrawer/home.dart';
import 'package:navdrawer/settings.dart';

class DrawerEx extends StatefulWidget {
  String a = 'Tops';

  @override
  State<DrawerEx> createState() => _DrawerExState();
}

class _DrawerExState extends State<DrawerEx>
{
  int selectedindex=0;
  List optionstitle =
      [
        "Home Page",
        "About Page",
        "Settings"
      ];
  List optionsscreen =
  [
    HomeScreen(),
    AboutScreen(),
    SettingsScreen()
  ];
   _onSelectDrawerItem(int index)
  {
    setState(() {
      selectedindex=index;
    });
    Navigator.pop(context); //close the drawer
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text("Drawer Example"),),
        body: optionsscreen[selectedindex],
        drawer: Drawer
          (
            child: ListView
              (
                padding: EdgeInsets.zero,
                children:
                [
                  UserAccountsDrawerHeader
                    (
                      accountName: Text("Tops PGFlutter"),
                      accountEmail: Text("pg@gebmail.com"),
                      currentAccountPicture: CircleAvatar
                        (
                          backgroundColor: Colors.orange,
                          child: Text
                            (
                              widget.a[0].toUpperCase(),
                              style: TextStyle(fontSize: 30.0,color:Colors.white)
                            )
                        )
                      ),
                     for (int i=0;i<optionstitle.length;i++)
                       ListTile
                         (
                           leading: Icon(Icons.circle),
                           title: Text(optionstitle[i]),
                           selectedTileColor: Colors.purple.shade100,
                           selected: selectedindex==i,
                           onTap: ()=>_onSelectDrawerItem(i),
                       )
                ],
              )
          ),
      );
  }
}
