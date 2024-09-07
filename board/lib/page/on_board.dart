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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.7,
            color: Colors.white,
            child: PageView.builder(
              itemCount: boardsData.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: _pageController,
              itemBuilder: (context, index) {
                return onBoardingItems(size, index);
              },
            ),
          ),
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
                  color: Colors.black38),
              child: Center(
                child: Text(
                  currentPage == boardsData.length - 1
                      ? "Get Stared"
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                boardsData.length,
                (index) =>
                    indicatorForSlider(index: index, currentPage: currentPage),
              )
            ],
          )
        ],
      ),
    );
  }

  Column onBoardingItems(Size size, int index) {
    return Column(
      children: [
        Container(
          height: size.height * 0.6,
         
          child: Image.asset(
            boardsData[index].image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Text.rich(
          TextSpan(text: boardsData[index].title),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          boardsData[index].text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15.5,
            color: Colors.black38,
          ),
        )
      ],
    );
  }
}
