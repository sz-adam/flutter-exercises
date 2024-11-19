import 'package:flutter/material.dart';
import 'package:planets/components/background_container.dart';
import 'package:planets/components/details_card.dart';
import 'package:planets/model/planets_model.dart';

class CelestialDetailPages extends StatefulWidget {
  final CelestialBodyData data;

  const CelestialDetailPages({super.key, required this.data});

  @override
  _CelestialDetailPagesState createState() => _CelestialDetailPagesState();
}

class _CelestialDetailPagesState extends State<CelestialDetailPages>
    with SingleTickerProviderStateMixin {
  final List<bool> _isVisible = [];

  @override
  void initState() {
    super.initState();
    _isVisible.addAll(List.generate(5, (index) => false));
    _animateCards();
  }

  Future<void> _animateCards() async {
    for (int i = 0; i < _isVisible.length; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        setState(() {
          _isVisible[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final details = [
      {'icon': Icons.circle, 'value': widget.data.diameter},
      {'icon': Icons.line_weight, 'value': widget.data.mass},
      {'icon': Icons.arrow_downward, 'value': widget.data.gravity},
      {'icon': Icons.thermostat, 'value': widget.data.temperature},
      {'icon': Icons.timelapse, 'value': widget.data.orbitalPeriod},
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.data.name,
            style: const TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        body: BackgroundContainer(
          child: SingleChildScrollView(
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
                        tag: widget.data.name,
                        child: Image.asset(
                          widget.data.imageUrl,
                          width: 600,
                          height: 500,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                ...details.asMap().entries.map((entry) {
                  final index = entry.key;
                  final detail = entry.value;
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: _isVisible[index] ? 1.0 : 0.0,
                    curve: Curves.easeInOut,
                    child: DetailCard(
                      icon: detail['icon'] as IconData,
                      value: detail['value']! as String,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
