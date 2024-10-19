import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scroll_navigation/components/post.dart';
import 'package:scroll_navigation/model/posts_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

//postok lekérése
  Future<List<PostModel>> getPost() async {
    final client = http.Client();
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<PostModel> posts =
          body.map((dynamic item) => PostModel.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: getPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load posts'),
            );
          }
          if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Post(post: post);
              },
            );
          }
          return const Center(
            child: Text('No posts available'),
          );
        },
      ),
    );
  }
}
