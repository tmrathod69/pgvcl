import 'package:day8onlyapi/api_service.dart';
import 'package:flutter/material.dart';

class MarvelListScreen extends StatefulWidget {
  const MarvelListScreen({super.key});

  @override
  State<MarvelListScreen> createState() => _MarvelListScreenState();
}

class _MarvelListScreenState extends State<MarvelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title:Text('Marvel List')),
        body: FutureBuilder
          (
            future: fetchMarvelCharacter(),
            builder: (context, snapshot)
            {
               if (snapshot.connectionState==ConnectionState.waiting)
                 {
                   return const Center(child: CircularProgressIndicator());
                 }
               else if (snapshot.hasError)
                 {
                   return Center(child: Text('Error: ${snapshot.error}'));
                 }
               else if (!snapshot.hasData || snapshot.data!.isEmpty)
                 {
                   return const Center(child: Text('No data available'));
                 }
               final characters = snapshot.data!;

               return ListView.builder(itemCount: characters.length,
                   itemBuilder: (context,index)
               {
                 final character = characters[index];
                 SingleChildScrollView();
                 return ListTile
                   (
                     leading: Image.network(character.imageurl!, width:50, height:50),
                     title: Text(character.name!,style: TextStyle(fontSize: 30.00),),
                     subtitle:  Column
                       (
                         children:
                         [
                           Text(character.realname!,style: TextStyle(fontSize: 15.00),),
                           Text(character.team!,style: TextStyle(fontSize: 15.00),)
                         ],
                     ),
                   );
               }
               );






            }
          )
    );
  }
}
