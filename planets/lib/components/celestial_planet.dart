import 'package:flutter/material.dart';
import 'package:planets/model/planets_model.dart';
import 'package:planets/pages/celestial_detail_pages.dart';

class CelestialPlanetView extends StatelessWidget {
  final List<CelestialBodyData> celestialDataList;
  final int currentIndex;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const CelestialPlanetView({
    super.key,
    required this.celestialDataList,
    required this.currentIndex,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        child: PageView.builder(
          controller: pageController,
          itemCount: celestialDataList.length,
          onPageChanged: onPageChanged,
          itemBuilder: (context, index) {
            final celestialData = celestialDataList[index];
            return GestureDetector(
              onTap: () {},
              child: Image.asset(
                celestialData.imageUrl,
                width: 300,
                height: 250,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
