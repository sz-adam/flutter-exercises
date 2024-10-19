import 'package:flutter/material.dart';
import 'package:scroll_navigation/page/home_screen.dart';
import 'package:scroll_navigation/page/search_screen.dart';
import 'package:scroll_navigation/page/settings_screen.dart';

final List<Map<String, dynamic>> navItems = [
  {
    'page': HomeScreen(),
    'icon': Icons.home,
    'selectedIcon': Icons.home_work,
    'label': 'Home',
  },
  {
    'page': SearchScreen(),
    'icon': Icons.search,
    'selectedIcon': Icons.search_off,
    'label': 'Search',
  },
  {
    'page': SettingsScreen(),
    'icon': Icons.settings_applications_rounded,
    'selectedIcon': Icons.settings,
    'label': 'Settings',
  },
];
