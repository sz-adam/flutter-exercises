import 'package:biometric/widget/biometric.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        //vissza gomb kikapcsolása
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Visszalépünk a Biometric oldalra
                Navigator.of(context).pop((route) => Biometric());
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
