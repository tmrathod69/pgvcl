import 'package:mvvmexample/domain/repositories/postrepository.dart';

class GetPosts
{
  final PostRepository repository;

  GetPosts({required this.repository});

  Fiture<List<Post>> execite() async
  {
    return await repository(Post);
  }
}