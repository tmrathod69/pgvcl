import 'package:cached_network_image/cached_network_image.dart';
import 'package:day8sharedprefex/networkservice.dart';
import 'package:day8sharedprefex/post.dart';
import 'package:flutter/material.dart';

import 'localstorageservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  NetworkService networkService = NetworkService();
  final LocalStorageService _localStorageService = LocalStorageService();
  List<Post> post = [];
  bool _isLoading = true;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    _loadposts();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title:Text("My Data")),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : post.isEmpty
            ? const Center(child: Text('No posts available.'))
            : GridView.builder
            (
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (
                crossAxisCount: 2,
                crossAxisSpacing: 10,  // Space between columns
                mainAxisSpacing: 10,  // Space between rows
                childAspectRatio: 1,  // Aspect ratio of each grid item
              ),
             padding: const EdgeInsets.all(10),
              itemCount: post.length,
            itemBuilder: (context,index)
            {
              final post1 = post[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                        child: post1.url!.isNotEmpty
                            ? CachedNetworkImage(
                          imageUrl: post1.url!,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                          fit: BoxFit.cover,
                        )
                            : const Icon(Icons.image, size: 50),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        post1.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );


            },
        ),

      );
  }

  Future<void> _loadposts() async
  {
    try
    {
      List<Post> localPosts = await _localStorageService.loadposts();
      // if(connectivity is found)
      //   {
      //
      //   }
      // else
      //   {
      //
      //   }
      if(localPosts.isNotEmpty)
      {
        setState(()
        {
            post = localPosts;
            _isLoading = false;
        });
      }
      else
      {
        List<Post> apiPosts = await networkService.fetchPosts();
        await _localStorageService.savePosts(apiPosts);
        setState(()
        {
          post = localPosts;
          _isLoading = false;
        });
      }

    }
    catch(e)
    {
      setState(() {
        _isLoading = false;
      });
      print("Error loading posts: $e");
    }
  }
}
