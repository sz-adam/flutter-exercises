import 'package:flutter/material.dart';
import 'package:scroll_navigation/model/posts_model.dart';

class Post extends StatefulWidget {
  const Post({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ))),
      child: Center(
        child: Column(
          children: [
            Text(
              widget.post.title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(widget.post.body!),
          ],
        ),
      ),
    );
  }
}
