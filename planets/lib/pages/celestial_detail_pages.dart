import 'package:flutter/material.dart';
import 'package:planets/components/details_card.dart';
import 'package:planets/model/planets_model.dart';

class CelestialDetailPages extends StatelessWidget {
  final CelestialBodyData data;

  const CelestialDetailPages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final details = [
      {'icon': Icons.circle, 'value': data.diameter},
      {'icon': Icons.line_weight, 'value': data.mass},
      {'icon': Icons.arrow_downward, 'value': data.gravity},
      {'icon': Icons.thermostat, 'value': data.temperature},
      {'icon': Icons.timelapse, 'value': data.orbitalPeriod},
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            data.name,
            style: const TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.5,
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    right: screenWidth * 0.05,
                    top: -screenHeight * 0.1,
                    child: Hero(
                      tag: data.name,
                      child: Image.asset(
                        data.imageUrl,
                        width: 600,
                        height: 500,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              ...details.map((detail) => DetailCard(
                icon: detail['icon'] as IconData,  // Passing the icon
                value: detail['value']! as String,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
