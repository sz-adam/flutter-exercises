import 'package:flutter/material.dart';
import '../model/planets_model.dart';

class CelestialName extends StatelessWidget {
  final List<CelestialBodyData> celestialDataList;
  final int currentIndex;

  const CelestialName({
    Key? key,
    required this.celestialDataList,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: Text(
            celestialDataList[currentIndex].name,
            key: ValueKey<int>(currentIndex),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
