import 'package:flutter/material.dart';

class GridAnimationPage extends StatefulWidget {
  const GridAnimationPage({Key? key}) : super(key: key);

  @override
  _GridAnimationPageState createState() => _GridAnimationPageState();
}

class _GridAnimationPageState extends State<GridAnimationPage>
    with TickerProviderStateMixin {
  final List<IconData> iconDataList = [
    Icons.favorite,
    Icons.star,
    Icons.thumb_up,
    Icons.lightbulb,
    Icons.access_alarm,
    Icons.camera_alt,
    Icons.home,
    Icons.work,
  ];

  List<AnimationController> _controllers = [];
  List<Animation<Offset>> _offsetAnimations = [];
  List<AnimationController> _iconControllers = [];
  List<Animation<double>> _iconScaleAnimations = [];

  @override
  void initState() {
    super.initState();

    // Animáció vezérlők minden grid elemhez
    for (int i = 0; i < iconDataList.length; i++) {
      // SlideTransition animáció
      final controller = AnimationController(
        duration: Duration(milliseconds: 500 + (i * 200)),
        vsync: this,
      );
      _controllers.add(controller);

      // Bal oldalra páros, jobb oldalra páratlan index
      final offsetAnimation = Tween<Offset>(
        begin: i % 2 == 0 ? Offset(-1.5, 0) : Offset(1.5, 0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
      _offsetAnimations.add(offsetAnimation);

      // Indítjuk a slide animációt
      controller.forward();

      // Ikon animációhoz külön AnimationController
      final iconController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      )..forward();
      _iconControllers.add(iconController);

      // Scale animáció (méret animálása)
      final scaleAnimation = Tween<double>(begin: 0.1, end: 1.2).animate(
        CurvedAnimation(
          parent: iconController,
          curve: Curves.easeInOut,
        ),
      );
      _iconScaleAnimations.add(scaleAnimation);
    }
  }

  @override
  void dispose() {
    // Megszabadulunk minden AnimationController-től
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var iconController in _iconControllers) {
      iconController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated GridView Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemCount: iconDataList.length,
          itemBuilder: (context, index) {
            return SlideTransition(
              position: _offsetAnimations[index],
              child: Card(
                color: Colors.blueAccent,
                child: Center(
                  child: ScaleTransition(
                    // Ikon méretének animálása
                    scale: _iconScaleAnimations[index],
                    child: Icon(
                      iconDataList[index],
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
