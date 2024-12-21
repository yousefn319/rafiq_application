import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(2); // Set the center button action
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff071952),
        child: SvgPicture.asset('images/courses/robot.svg'),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Center FAB
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 16.0, // Space around the FAB notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0
                      ? const Color(0xff071952)
                      : const Color(0xff088395)),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.menu_book,
                  color: _selectedIndex == 1
                      ? const Color(0xff071952)
                      : const Color(0xff088395)),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 60), // Adds space between the two sides
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.favorite,
                  color: _selectedIndex == 3
                      ? const Color(0xff071952)
                      : const Color(0xff088395)),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.person,
                  color: _selectedIndex == 4
                      ? const Color(0xff071952)
                      : const Color(0xff088395)),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
