import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String username;

  const Home({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
      ),
      body: Center(
        child: Text(
          'Hello, $username!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
