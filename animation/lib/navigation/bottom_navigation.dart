import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  // Oldalak, ikonok, háttérszínek és ikon színek tömbben
  final List<Map<String, dynamic>> _pages = [
    {
      'page': Text('GridAnimationPage', style: TextStyle(fontSize: 24)),
      'icon': Icons.home,
      'backgroundColor': Colors.blue,
      'iconColor': Colors.white,
      'label': 'Grid',
    },
    {
      'page': Text('CarouselPage', style: TextStyle(fontSize: 24)),
      'icon': Icons.search,
      'backgroundColor': Colors.green,
      'iconColor': Colors.white,
      'label': 'Carousel',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation app'),
        backgroundColor: _pages[_selectedIndex]['backgroundColor'],
      ),
      body: Center(
        child: _pages[_selectedIndex]['page'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _pages.map((page) {
          return BottomNavigationBarItem(
            icon: Icon(
              page['icon'],
              color: page['iconColor'],
            ),
            label: page['label'],
            backgroundColor: page['backgroundColor'],
          );
        }).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
