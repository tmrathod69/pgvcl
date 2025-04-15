import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  Color _bgcolor = Colors.white;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
        appBar: AppBar(title: Text("My Component"),),
        body: Center
        (
          child: Column
          (
             crossAxisAlignment: CrossAxisAlignment.start,
             children:
             [
                RadioListTile
                (
                    title: Text('Green'),
                    value: Colors.green,
                    onChanged: (value)
                    {
                      setState()
                      {
                         _bgcolor = value;
                      };
                    },
                    groupValue: _bgcolor
                ),
                RadioListTile
                (
                  title: Text('Red'),
                  value: Colors.red,
                  onChanged: (value)
                  {
                    setState(()
                    {
                       _bgcolor = value;
                    };
                  }),
                  groupValue: _bgcolor
                ),
             ],
          )
        )
    );
  }
}
