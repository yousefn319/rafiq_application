import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:rafiq/screens/favorites_screen.dart';
import 'package:rafiq/screens/home_page.dart';
import 'package:rafiq/screens/my_courses.dart';
import 'package:rafiq/screens/profile_screen.dart';
import 'package:rafiq/screens/rafiq_chatbot_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget navDest(String label, IconData icon, ColorScheme colorScheme) {
  return NavigationDestination(
      label: label,
      icon: Icon(icon, color: colorScheme.secondary),
      selectedIcon: Icon(icon, color: colorScheme.primary));
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    const HomePage(),
    const MyCourses(),
    const FavoritesScreen(),
    const ProfileScreen(),
    //const RafiqChatbotScreen(),
  ];

  void pageChanged(int index) => setState(() => _selectedIndex = index);
  void _onItemTapped(int index) => setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });


  @override
  Widget build(BuildContext context) {
    bool showAppBar = _selectedIndex == 0;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: PageView(controller: pageController, onPageChanged: pageChanged, children: _screens),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RafiqChatbotScreen())),
        shape: const CircleBorder(),
        backgroundColor: colorScheme.primary,
        child: const SvgPicture(AssetBytesLoader('images/buttons/robot.svg.vec'))
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Center FAB
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5.0, // Space around the FAB notch
        child: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            indicatorColor: Colors.white,
            destinations: [
              navDest('Home', Icons.home_outlined, colorScheme),
              navDest('My Courses', Icons.book_outlined, colorScheme),
              navDest('Favourites', Icons.favorite_outlined, colorScheme),
              navDest('Profile', Icons.person_outlined, colorScheme)
            ]),
      ),
    );
  }
}
