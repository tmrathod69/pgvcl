import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text('Posts'),),
        body: Consumer(builder:
            (context,value,child)
            {
               return ListView.builder
                 (
                   Itemcount:
                   itemBuilder:(context,index)
                   {

                   }
               )
            }
        )
    );
  }
}
