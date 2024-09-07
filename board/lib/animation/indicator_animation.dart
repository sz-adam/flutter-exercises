 import 'package:flutter/material.dart';

AnimatedContainer indicatorForSlider({int? index, required int currentPage }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: currentPage == index ? 20 : 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: currentPage == index ? Colors.orange : Colors.indigoAccent,
      ),
    );
  }