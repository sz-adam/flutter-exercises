import 'package:flutter/material.dart';

import '../model/planets_model.dart';

class CelestialName extends StatelessWidget {
  const CelestialName({
    super.key,
    required this.celestialDataList,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final List<CelestialBodyData> celestialDataList;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Center(
            child: Text(
              celestialDataList[_currentIndex].name,
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
          )
        ],
      ),
    );
  }
}