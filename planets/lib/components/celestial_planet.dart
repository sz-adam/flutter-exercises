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
            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                double value = 1.0;
                if (pageController.position.haveDimensions) {
                  value = pageController.page! - index;
                  value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                }

                return Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CelestialDetailPages(
                              data: celestialData,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: celestialData.name,
                        child: Image.asset(
                          celestialData.imageUrl,
                          width: 300,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
