// domain/repositories/post_repository.dart


import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
