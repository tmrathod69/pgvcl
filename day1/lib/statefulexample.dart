
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
{
  int counter = 0;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Second Screen"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            Text("You have clicked Button $counter times",style: TextStyle(fontSize: 50.00),),
            ElevatedButton(
              onPressed: ()
              {
                setState(() {

                  counter--;

                });



              }, child: Text("Click Me", style: TextStyle(fontSize: 50.00),))


          ],

        ),
      ),
    );
  }
}
