import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/course_details.dart';
import 'package:rafiq_application/features/introscreens/presentation/popular_courses.dart';
import 'package:rafiq_application/widgets/search_bar.dart';

class AcademicCategory extends StatefulWidget {
  const AcademicCategory({super.key});

  @override
  _AcademicCategoryState createState() => _AcademicCategoryState();
}

class _AcademicCategoryState extends State<AcademicCategory> {
  int selectedButton = 1; // 0: No content, 1: First button, 2: Second button

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Category'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SearchBarA(),
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
                        'Academic',
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
                        'Non-Academic',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Add some spacing
              if (selectedButton == 1)
                SizedBox(
                  height: screenHeight * 0.9,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PopularCourses(),
                              ));
                        },
                        child: Container(
                          width: 185,
                          height: 180,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff999999),
                                  strokeAlign: BorderSide.strokeAlignCenter),
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/courses/kids.png',
                                height: 120,
                                width: 170,
                              ),
                              const Text(
                                'Kids Courses',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff071952)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (selectedButton == 2)
                SizedBox(
                  height: screenHeight * 1.3,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 12,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PopularCourses(),
                              ));
                        },
                        child: Container(
                          width: 194,
                          height: 188,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff999999),
                                  strokeAlign: BorderSide.strokeAlignCenter),
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/courses/ui.png',
                                height: 120,
                                width: 170,
                              ),
                              const Text(
                                'UI/UX',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff071952)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
