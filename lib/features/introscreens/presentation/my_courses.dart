import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/features/introscreens/presentation/course_details.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TextField(
                      cursorColor: Color(0xff088395),
                      decoration: InputDecoration(
                          labelText: 'Search courses',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: Color(0xff071952),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: BorderSide.strokeAlignCenter,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color(0xff088395),
                              )),
                          suffixIcon: Icon(Icons.mic_none),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 56, // Set height for square
                    width: 56, // Set width equal to height for square
                    decoration: BoxDecoration(
                      color: const Color(0xff071952), // Background color
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Button action
                      },
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.white, // Icon color
                      ),
                    ),
                  )
                ],
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
                        minimumSize: const Size(
                            0, 44), // Width set to 0, height is fixed
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
                        minimumSize: const Size(
                            0, 44), // Width set to 0, height is fixed
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
                                        'images/courses/flutter.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35, // Relative width
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
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              'Intro to UI/UX Design',
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
                                                  '4.4',
                                                  style: TextStyle(
                                                    color: Color(0xff202244),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
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
                                                    fontWeight: FontWeight.w600,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3, // Relative width
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
                                              0.04,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Flutter Development',
                                                  style: TextStyle(
                                                    color: Color(0xffFF6B00),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(width: 24),
                                                SvgPicture.asset(
                                                  'images/courses/Completed.svg',
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              'Intro to Dart',
                                              style: TextStyle(
                                                color: Color(0xff202244),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const Row(
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
        ),
      ),
    );
  }
}
