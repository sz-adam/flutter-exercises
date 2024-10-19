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
        title: const Text('Scroll Navigation'),
      ),
      body: navItems[_selectedIndex]['page'],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
           ),
        margin: const EdgeInsets.all(10),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: navItems.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;

            return BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == index ? item['selectedIcon'] : item['icon'],
              ),
              label: item['label'],
            );
          }).toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blue[200],
          onTap: _onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
