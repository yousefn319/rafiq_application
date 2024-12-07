import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_application/features/introscreens/presentation/academic_category.dart';
import 'package:rafiq_application/features/introscreens/presentation/course_details.dart';
import 'package:rafiq_application/widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int selectedButton = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: CircleAvatar(
              child: Image.asset('images/courses/aref.png'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Omar,',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'What do you want to learn today ?',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff999999),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            actions: [
              IconButton(
                color: Color(0xff088395),
                style: IconButton.styleFrom(backgroundColor: Colors.black12),
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  // Action for notification icon
                },
              ),
              SizedBox(
                width: 8,
              ),
              IconButton(
                color: Color(0xff088395),
                style: IconButton.styleFrom(backgroundColor: Colors.black12),
                icon: const Icon(Icons.message_outlined),
                onPressed: () {
                  // Action for messages icon
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment
                        .center, // Align the button in the center of the picture
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(16), // Rounded corners
                        child: Image.asset(
                          'images/courses/homeframe.png',
                          width:
                              double.infinity, // Replace with your image path
                          fit: BoxFit.fill, // Replace with your image path
                        ),
                      ),
                      Positioned(
                          top: 26,
                          left: 22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'New Offer',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Discount 20% for the first booking',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Color(0xff071952),
                                      fixedSize: Size(144, 18),
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      )),
                                  onPressed: () {},
                                  child: Text(
                                    'Book now',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcademicCategory(),
                          ));
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff088395)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedButton == 1
                          ? Colors.white
                          : const Color(0xff088395),
                      backgroundColor: selectedButton == 1
                          ? const Color(0xff088395)
                          : Colors.white,
                      minimumSize: const Size(194, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: Color(0xff088395),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedButton = 1; // Select the first button
                      });
                    },
                    child: const Text(
                      'Academic',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedButton == 2
                          ? Colors.white
                          : const Color(0xff088395),
                      backgroundColor: selectedButton == 2
                          ? const Color(0xff088395)
                          : Colors.white,
                      minimumSize: const Size(194, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: Color(0xff088395),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedButton = 2; // Select the second button
                      });
                    },
                    child: const Text('Non-Academic',
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              if (selectedButton == 1)
                SizedBox(
                  height: 188,
                  width: 1000,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetails(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Color(0xffD0D0D0))),
                            height: 140,
                            width: 288,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Stack(
                                    alignment: Alignment
                                        .center, // Align the button in the center of the picture
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded corners
                                        child: Image.asset(
                                          'images/courses/cyber.png',
                                          width:
                                              270, // Replace with your image path
                                          height: 120,
                                          fit: BoxFit
                                              .fill, // Replace with your image path
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        left:
                                            8, // Position the button at the bottom of the image

                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              color: Colors.white),
                                          height: 24,
                                          width: 44,
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                size: 16,
                                                Icons.star,
                                                color: Color(0xffFFE100),
                                              ),
                                              Text(
                                                '3.8 ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Academic course',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '1500',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff088395)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (selectedButton == 2)
                SizedBox(
                  height: 188,
                  width: 1000,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetails(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Color(0xffD0D0D0))),
                            height: 140,
                            width: 288,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Stack(
                                    alignment: Alignment
                                        .center, // Align the button in the center of the picture
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded corners
                                        child: Image.asset(
                                          'images/courses/uiuxcourse.png',
                                          width:
                                              270, // Replace with your image path
                                          height: 120,
                                          fit: BoxFit
                                              .fill, // Replace with your image path
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        left:
                                            8, // Position the button at the bottom of the image

                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              color: Colors.white),
                                          height: 24,
                                          width: 44,
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                size: 16,
                                                Icons.star,
                                                color: Color(0xffFFE100),
                                              ),
                                              Text(
                                                '3.8 ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'UI UX Diploma',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '4500',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff088395)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Our Instructors',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                  children: List.generate(
                5,
                (index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          width: double.infinity, // Width of the card
                          height: 248, // Height of the card
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              // Cover Photo
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/courses/homeframe.png'), // Cover photo
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // Profile Picture
                              Positioned(
                                top:
                                    42, // Overlapping the cover photo and details section
                                left:
                                    150, // Center horizontally (adjust based on width)
                                child: CircleAvatar(
                                  radius: 50, // Profile picture size
                                  backgroundImage: AssetImage(
                                      'images/courses/aref.png'), // Profile picture
                                ),
                              ),

                              // Name and Description Section
                              Positioned(
                                top: 148, // Below the profile picture
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        'mohamed aref', // Name
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'A passionate UI/UX designer with a knack for creating intuitive and beautiful interfaces.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(2); // Set the center button action
        },
        shape: CircleBorder(),
        backgroundColor: Color(0xff071952),
        child: SvgPicture.asset('images/buttons/robot.svg'),
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
                      ? Color(0xff071952)
                      : Color(0xff088395)),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.menu_book,
                  color: _selectedIndex == 1
                      ? Color(0xff071952)
                      : Color(0xff088395)),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 60), // Adds space between the two sides
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.favorite,
                  color: _selectedIndex == 3
                      ? Color(0xff071952)
                      : Color(0xff088395)),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              iconSize: 32,
              icon: Icon(Icons.person,
                  color: _selectedIndex == 4
                      ? Color(0xff071952)
                      : Color(0xff088395)),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
