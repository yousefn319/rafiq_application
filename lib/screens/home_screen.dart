import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:rafiq/screens/favorites_screen.dart';
import 'package:rafiq/screens/home_page.dart';
import 'package:rafiq/screens/messages_screen.dart';
import 'package:rafiq/screens/my_courses.dart';
import 'package:rafiq/screens/notifications_screen.dart';
import 'package:rafiq/screens/profile_screen.dart';
import 'package:rafiq/screens/rafiq_chatbot_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int selectedButton = 1;
  // List of screens
  final List<Widget> _screens = [
    const HomePage(),
    const MyCourses(),
    const RafiqChatbotScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool showAppBar = _selectedIndex == 0;
    return Scaffold(
      appBar: showAppBar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(
                  kToolbarHeight + 8), // Adjust height for padding
              child: Container(
                color: Colors.white, // AppBar color
                child: AppBar(
                  backgroundColor:
                      Colors.white, // Make AppBar itself transparent
                  elevation: 0, // Remove shadow
                  automaticallyImplyLeading: false,

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.asset(
                          'images/courses/profile_picture.jpg',
                          height: screenHeight * 0.055,
                          width: screenHeight * 0.055,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Ahmed,',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'What do you want to learn today ?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff999999),
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1, // Prevent overflow
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      color: const Color(0xff088395),
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.black12),
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsScreen(),
                            ));
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      color: const Color(0xff088395),
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.black12),
                      icon: const Icon(Icons.message_outlined),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MessagesScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 18)
                  ],
                ),
              ),
            )
          : null,
      body: _screens[_selectedIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(2); // Set the center button action
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff071952),
        child: SvgPicture(AssetBytesLoader('images/buttons/robot.svg.vec')),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Center FAB
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        shape: const CircularNotchedRectangle(),
        notchMargin: 16.0, // Space around the FAB notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.home_outlined,
                  color: _selectedIndex == 0
                      ? const Color(0xff071952)
                      : const Color(0xff088395)),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.menu_book_outlined,
                  color: _selectedIndex == 1
                      ? const Color(0xff071952)
                      : const Color(0xff088395)),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 60), // Adds space between the two sides
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.favorite_outline,
                  color: _selectedIndex == 3
                      ? const Color(0xff071952)
                      : const Color(0xff088395)),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.person_outline,
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
