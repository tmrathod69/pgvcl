import 'dart:convert';

import 'package:day8sharedprefex/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService
{
  //save data
  Future<void> savePosts(List<Post> posts) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> postsJson = posts.map((post) => json.encode(post.toJson())).toList();
    await prefs.setStringList('posts', postsJson);  // Store as a list of JSON strings
  }

  //get data
  Future<List<Post>> loadposts() async
  {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? postsJson = prefs.getStringList('posts');

    if(postsJson!=null)
    {
      return postsJson.map((post) => Post.fromJson(json.decode(post))).toList();
    }
    else
    {
      return [];
    }

  }



}