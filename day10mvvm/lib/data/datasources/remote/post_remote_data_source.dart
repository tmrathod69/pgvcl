// data/datasources/remote/post_remote_data_source.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../domain/entities/post.dart';

class PostRemoteDataSource {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
