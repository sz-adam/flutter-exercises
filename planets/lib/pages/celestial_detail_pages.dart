import 'package:flutter/material.dart';
import 'package:planets/model/planets_model.dart';

class CelestialDetailPages extends StatelessWidget {
  final CelestialBodyData data;

  const CelestialDetailPages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(data.name),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            Positioned(
                right: screenWidth * 0.01,
                top: -screenHeight * 0.1,
                child: Hero(
                    tag: data.name,
                    child: Image.asset(
                      data.imageUrl,
                      width: 600,
                      height: 500,
                    )))
          ],
        ),
      ),
    );
  }
}
