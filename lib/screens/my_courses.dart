import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/screens/course_details.dart';
import 'package:vector_graphics/vector_graphics.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  int selectedButton = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My courses'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        children: [
          SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                hintText: 'Search Courses',
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                // Remove shadow by ensuring elevation is 0
                elevation: const WidgetStatePropertyAll(0),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: selectedButton == 1
                        ? Colors.white
                        : const Color(0xff088395),
                    backgroundColor: selectedButton == 1
                        ? const Color(0xff088395)
                        : Colors.white,
                    minimumSize:
                        const Size(0, 44), // Width set to 0, height is fixed
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
                    'Ongoing',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 8), // Add space between the buttons
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: selectedButton == 2
                        ? Colors.white
                        : const Color(0xff088395),
                    backgroundColor: selectedButton == 2
                        ? const Color(0xff088395)
                        : Colors.white,
                    minimumSize:
                        const Size(0, 44), // Width set to 0, height is fixed
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
                  child: const Text(
                    'Completed',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (selectedButton == 1)
            SizedBox(
              width: double.infinity,
              child: Column(
                children: List.generate(
                  8,
                  (index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CourseDetails(type: 'My Course'),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height *
                                0.25, // Adjusted height to fit progress bar
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
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                        child: Image.asset(
                                          'images/courses/flutter.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'UI/UX Design',
                                                style: TextStyle(
                                                  color: Color(0xffFF6B00),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                'Intro to UI/UX Design',
                                                style: TextStyle(
                                                  color: Color(0xff202244),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.star,
                                                      color: Color(0xffFCCB40)),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    '4.4',
                                                    style: TextStyle(
                                                      color: Color(0xff202244),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(width: 16),
                                                  Text('|'),
                                                  SizedBox(width: 16),
                                                  Text(
                                                    '30 Hrs 06 Mins',
                                                    style: TextStyle(
                                                      color: Color(0xff202244),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Progress bar
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Progress',
                                                    style: TextStyle(
                                                      color: Color(0xff202244),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  LinearProgressIndicator(
                                                    value:
                                                        0.6, // Example progress value (60%)
                                                    backgroundColor:
                                                        Colors.grey,
                                                    color: Color(0xffFF6B00),
                                                    minHeight: 6,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.02, // Relative spacing
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          if (selectedButton == 2)
            SizedBox(
              width: double.infinity,
              child: Column(
                children: List.generate(
                  8,
                  (index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CourseDetails(type: 'My Course'),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height *
                                0.2, // Relative height
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
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    'images/courses/network.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.3, // Relative width
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Flutter Development',
                                              style: TextStyle(
                                                color: Color(0xffFF6B00),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(width: 24),
                                            SvgPicture(
                                              AssetBytesLoader(
                                                  'images/courses/Completed.svg.vec'),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Intro to Dart',
                                          style: TextStyle(
                                            color: Color(0xff202244),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Color(0xffFCCB40)),
                                            SizedBox(width: 4),
                                            Text(
                                              '3.9',
                                              style: TextStyle(
                                                color: Color(0xff202244),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Text('|'),
                                            SizedBox(width: 16),
                                            Text(
                                              '22 Hrs 12 Mins',
                                              style: TextStyle(
                                                color: Color(0xff202244),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.02, // Relative spacing
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
