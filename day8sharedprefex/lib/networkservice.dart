import 'dart:convert';
import 'package:day8sharedprefex/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkService
{
  var url = "https://prakrutitech.buzz/AndroidAPI/dashboard_view.php";

  Future<List<Post>> fetchPosts() async
  {
    try
    {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200)
      {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Post.fromJson(json)).toList();
      }
      else
      {
        throw Exception('Failed to load posts');
      }

    }
    catch (e)
    {
        throw Exception('Error fetching posts: $e');
    }

  }
}