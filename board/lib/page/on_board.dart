import 'package:board/animation/indicator_animation.dart';
import 'package:board/model/on_boards_model.dart';
import 'package:board/page/home.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: boardsData.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: _pageController,
            itemBuilder: (context, index) {
              return Image.asset(
                boardsData[index].image,
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
              );
            },
          ),
          // Positioned elements (button, text, indicator) on top of the image
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Title text
                Text(
                  boardsData[currentPage].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Subtitle text
                Text(
                  boardsData[currentPage].text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),
                // Continue or Get Started button
                GestureDetector(
                  onTap: () {
                    if (currentPage == boardsData.length - 1) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Home(),
                          ),
                          (route) => false);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black38,
                    ),
                    child: Center(
                      child: Text(
                        currentPage == boardsData.length - 1
                            ? "Get Started"
                            : "Continue",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Indicator for the slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      boardsData.length,
                      (index) => indicatorForSlider(
                          index: index, currentPage: currentPage),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
