import 'package:flutter/material.dart';
import 'package:scroll_navigation/utils/navigation_list.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  bool _isVisibleNavigatio = true;
  double _scrollPosition = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleScroll(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      double currentScrollPosition = scrollInfo.metrics.pixels;

      if (currentScrollPosition < _scrollPosition) {
        setState(() {
          _isVisibleNavigatio = true; // Navigáció megjelenítése
        });
      } else if (currentScrollPosition > _scrollPosition) {
        setState(() {
          _isVisibleNavigatio = false; // Navigáció eltüntetése
        });
      }
      _scrollPosition = currentScrollPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Navigation'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          _handleScroll(scrollInfo);
          return true;
        },
        child: Stack(
          children: [
            navItems[_selectedIndex]['page'],
            // Navigációs sáv animáció
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              bottom: _isVisibleNavigatio ? 0 : -80,
              left: 0,
              right: 0,
              //Navigáció style
              child: Container(
                height: 60,
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
                        _selectedIndex == index
                            ? item['selectedIcon']
                            : item['icon'],
                      ),
                      label: item['label'],
                    );
                  }).toList(),
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.blue[200],
                  onTap: _onItemTapped,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
