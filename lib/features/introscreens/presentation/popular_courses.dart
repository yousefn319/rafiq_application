import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/course_details.dart';

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
              )
            : Text('Popular Courses'),
        centerTitle: true,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: Color(0xff071952),
                foregroundColor: Colors.white),
            icon: Icon(Icons.search),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetails(),
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
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16)),
                          child: Image.asset(
                            'images/courses/flutter.png',
                            width: 166,
                            height: 166,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: SizedBox(
                            width: 200,
                            height: 166,
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
                                        icon: Icon(Icons.favorite_outline)),
                                  ],
                                ),
                                Text(
                                  'UI UX Diploma',
                                  style: TextStyle(
                                      color: Color(0xff202244),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  softWrap: true, // Ensure text wraps
                                  overflow:
                                      TextOverflow.ellipsis, // softWrap: true,
                                ),
                                // SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
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
                                      width: 16,
                                    ),
                                    Text(
                                      '|',
                                      style: TextStyle(
                                          color: Color(0xff202244),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      '30 Hrs 06 Mins',
                                      style: TextStyle(
                                          color: Color(0xff202244),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  '1000 EGP',
                                  style: TextStyle(
                                      color: Color(0xff088395),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
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
      ),
    );
  }
}
