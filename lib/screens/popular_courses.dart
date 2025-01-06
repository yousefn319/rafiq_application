import 'package:flutter/material.dart';
import 'package:rafiq/screens/course_details.dart';

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
              )
            : const Text('Popular Courses'),
        centerTitle: true,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: const Color(0xff071952),
                foregroundColor: Colors.white),
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear(); // Clear search when closed
                }
              });
            },
          ),
          const SizedBox(
            width: 4,
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CourseDetails(
                          type: 'Course Details',
                        ),
                      ));
                },
                child: Container(
                  // height: 166,
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
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        child: Image.asset(
                          'images/courses/flutter.png',
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.02,
                          ),
                          child: SizedBox(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        style: IconButton.styleFrom(),
                                        onPressed: () {},
                                        icon:
                                            const Icon(Icons.favorite_outline)),
                                  ],
                                ),
                                const Text(
                                  'UI UX Diploma',
                                  style: TextStyle(
                                      color: Color(0xff202244),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1, // Prevent overflow
                                  softWrap: false, // Ensure text wraps
                                  overflow:
                                      TextOverflow.ellipsis, // softWrap: true,
                                ),
                                // SizedBox(height: 8),
                                SizedBox(
                                  width: 188,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffFCCB40),
                                          ),
                                          Text(
                                            '4.4',
                                            style: TextStyle(
                                                color: Color(0xff202244),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      const Text(
                                        '|',
                                        style: TextStyle(
                                            color: Color(0xff202244),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      const Text(
                                        '30 Hrs 06 Mins',
                                        style: TextStyle(
                                            color: Color(0xff202244),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 1, // Prevent overflow
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '1000 EGP',
                                  style: TextStyle(
                                      color: Color(0xff088395),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          );
        },
      ),
    );
  }
}
