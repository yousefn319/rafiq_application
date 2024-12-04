import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AcademicCategory extends StatefulWidget {
  @override
  _AcademicCategoryState createState() => _AcademicCategoryState();
}

class _AcademicCategoryState extends State<AcademicCategory> {
  int selectedButton = 1; // 0: No content, 1: First button, 2: Second button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Category'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TextField(
                      cursorColor: Color(0xff088395),
                      obscureText: true,
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
                  SizedBox(
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
                    child: Text('Non-Academic', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Add some spacing
              if (selectedButton == 1)
                Wrap(
                  spacing: 12.0, // Space between widgets horizontally
                  runSpacing: 12.0, // Space between lines vertically
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    // First Row (2 widgets side by side)
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/kids.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Kids Courses',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/primary.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Primary education',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Second Row (2 widgets side by side)
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/prep.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Preparatory education',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/secondary.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Secondary education',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 194,
                          height: 188,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff999999),
                                  strokeAlign: BorderSide.strokeAlignCenter),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/courses/university.png',
                                height: 120,
                                width: 170,
                              ),
                              Text(
                                'University education',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff071952)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
              if (selectedButton == 2)
                Wrap(
                  spacing: 12.0, // Space between widgets horizontally
                  runSpacing: 12.0, // Space between lines vertically
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    // First Row (2 widgets side by side)
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/design.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              '3D Design',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/graphic.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Graphic Design',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Second Row (2 widgets side by side)
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/web.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Web Development',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/cyber.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Cybersecurity',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/network.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Network Security',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/ui.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'UI/UX',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/ai.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'AI',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 194,
                        height: 188,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff999999),
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'images/courses/flutter.png',
                              height: 120,
                              width: 170,
                            ),
                            Text(
                              'Flutter',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff071952)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}