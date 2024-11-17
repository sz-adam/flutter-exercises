import 'package:flutter/material.dart';

import '../model/planets_model.dart';

class ScrollImage extends StatefulWidget {
  final List<CelestialBodyData> celestialDataList;
  final int currentIndex;
  final PageController pageController;

  const ScrollImage({
    super.key,
    required this.celestialDataList,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < widget.celestialDataList.length; i++) ...[
                    GestureDetector(
                      onTap: () {
                        // aktuális index frissítése
                        widget.pageController.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: AnimatedScale(
                        scale: widget.currentIndex == i ? 1.2 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          widget.celestialDataList[i].imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Bolygók közötti vonal
                    if (i < widget.celestialDataList.length - 1)
                      Container(
                        width: 60,
                        height: 2,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
