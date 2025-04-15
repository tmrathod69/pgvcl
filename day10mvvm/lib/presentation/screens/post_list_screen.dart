// presentation/screens/post_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/post_view_model.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Trigger the fetchPosts when the screen is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostViewModel>(context, listen: false).fetchPosts();
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Consumer<PostViewModel>(
        builder: (context, viewModel, child) {
          // Handle loading state
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle error state
          if (viewModel.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.errorMessage),
                  ElevatedButton(
                    onPressed: () => viewModel.retry(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Handle displaying posts
          return ListView.builder(
            itemCount: viewModel.posts.length,
            itemBuilder: (context, index) {
              final post = viewModel.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
    );
  }
}
