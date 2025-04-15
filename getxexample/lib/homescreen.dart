import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class HomeScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold
      (
        appBar: AppBar(title: Text("First Screen"),),
        body: Center(child: Text("Count: ${counterProvider.count}"),),
        floatingActionButton: Column
          (
            mainAxisAlignment: MainAxisAlignment.end,
            children:
            [

                FloatingActionButton(onPressed: ()
                {
                      counterProvider.increment();
                      Get.snackbar("Updated", "Count is now ${counterProvider.count}");

                },child: Icon(Icons.add),),
                SizedBox(height: 10,),
                FloatingActionButton(onPressed: ()
                {
                  Get.toNamed('/second');
                },child: Icon(Icons.arrow_back_outlined),)

            ],
          ),
      );
  }
}
