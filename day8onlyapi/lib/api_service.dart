import 'dart:convert';

import 'marvel_character.dart';
import 'package:http/http.dart' as http;

Future<List<MarvelCharacter>> fetchMarvelCharacter() async
{
  final response = await http.get(Uri.parse('https://simplifiedcoding.net/demos/marvel/'));
  if (response.statusCode==200)
    {
       final List<dynamic> data = json.decode(response.body);
       return data.map((json) => MarvelCharacter.fromJson(json)).toList();
    }
  else
    {
      throw Exception('Failed to Load Marvel Characters');
    }
}