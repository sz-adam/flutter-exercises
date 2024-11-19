import 'package:flutter/material.dart';
import 'package:planets/components/celestial_name.dart';
import 'package:planets/components/celestial_planet.dart';
import 'package:planets/components/scroll_image.dart';
import 'package:planets/model/planets_model.dart';
import 'package:planets/components/background_container.dart'; // Importáld az új komponenst

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final celestialDataList = getCelestialBodyData();

    return SafeArea(
      child: Scaffold(
        body: BackgroundContainer(
          child: Stack(
            children: [
              //Bolygók neve
              CelestialName(
                celestialDataList: celestialDataList,
                currentIndex: _currentIndex,
              ),
              //bolygók megjelenítésére
              CelestialPlanetView(
                celestialDataList: celestialDataList,
                currentIndex: _currentIndex,
                pageController: _pageController,
                onPageChanged: (index) {
                  setState(
                        () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              //Scroll
              ScrollImage(
                celestialDataList: celestialDataList,
                currentIndex: _currentIndex,
                pageController: _pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
