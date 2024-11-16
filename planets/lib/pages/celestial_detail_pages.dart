import 'package:flutter/material.dart';
import 'package:planets/model/planets_model.dart';

class CelestialDetailPages extends StatelessWidget {
  final CelestialBodyData data;

  const CelestialDetailPages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: Text(data.name),
      ),
    );
  }
}
