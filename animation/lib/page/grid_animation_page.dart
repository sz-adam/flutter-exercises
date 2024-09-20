import 'package:flutter/material.dart';

class GridAnimationPage extends StatefulWidget {
  const GridAnimationPage({ Key? key }) : super(key: key);

  @override
  _GridAnimationPageState createState() => _GridAnimationPageState();
}

class _GridAnimationPageState extends State<GridAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Grid animation'),),
    );
  }
}