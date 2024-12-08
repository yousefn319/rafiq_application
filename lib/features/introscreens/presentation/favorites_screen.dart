import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedButton = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
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
                        'Courses',
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
                      child: const Text('Instructors',
                          style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (selectedButton == 1)
                  Column(
                    children: List.generate(
                      8,
                      (index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              height: 202,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment
                                          .center, // Align the button in the center of the picture
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              12), // Rounded corners
                                          child: Image.asset(
                                            'images/courses/cyber.png',
                                            width: double
                                                .infinity, // Replace with your image path
                                            height: 120,
                                            fit: BoxFit
                                                .cover, // Replace with your image path
                                          ),
                                        ),
                                        Positioned(
                                          top: 12,
                                          left:
                                              12, // Position the button at the bottom of the image

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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            right: 8,
                                            top: 8,
                                            child: IconButton(
                                                style: IconButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white70),
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red.shade400,
                                                )))
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
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
                                          '1500 EGP',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff088395)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: Color(0xffD0D0D0),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '120 h',
                                          style: TextStyle(
                                              color: Color(0xffD0D0D0),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                if (selectedButton == 2)
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
                                boxShadow: const [
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
                                    decoration: const BoxDecoration(
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
                                  const Positioned(
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
                                          const Text(
                                            'mohamed aref', // Name
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
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
                                  Positioned(
                                      right: 8,
                                      top: 8,
                                      child: IconButton(
                                          style: IconButton.styleFrom(
                                              backgroundColor: Colors.white60),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red.shade400,
                                          )))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  )),
              ],
            ),
          ),
        ));
  }
}
