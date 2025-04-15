import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class SecondScreen extends StatelessWidget
{
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    final count = context.watch<CounterProvider>().count;

    return Scaffold
      (
        appBar: AppBar(title: Text("Second Screen"),),
        body: Center(
        child: Text('Count from Provider:$count',style: TextStyle(fontSize: 24),),
      ));
  }
}
