import 'package:flutter/material.dart';
import 'package:scroll_navigation/utils/navigation_list.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Navigation '),
      ),
      body: navItems[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: navItems.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item['icon']),
            label: item['label'],
          );
        }).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
