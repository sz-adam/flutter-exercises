import 'package:flutter/material.dart';
import 'package:scroll_navigation/page/home_screen.dart';
import 'package:scroll_navigation/page/search_screen.dart';
import 'package:scroll_navigation/page/settings_screen.dart';

final List<Map<String, dynamic>> navItems = [
  {
    'page': HomeScreen(),
    'icon': Icons.home,
    'label': 'Home',
  },
  {
    'page': SearchScreen(),
    'icon': Icons.search,
    'label': 'Search',
  },
  {
    'page': SettingsScreen(),
    'icon': Icons.settings,
    'label': 'Settings',
  },
];
