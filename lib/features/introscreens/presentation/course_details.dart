import 'package:flutter/material.dart';
import 'package:rafiq_application/widgets/button.dart';
import 'package:rafiq_application/widgets/read_more_description.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  int selectedButton = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
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
                            BorderRadius.circular(8), // Rounded corners
                        child: Image.asset(
                          'images/courses/uiuxcourse.png',
                          width:
                              double.infinity, // Replace with your image path
                          fit: BoxFit.fill, // Replace with your image path
                        ),
                      ),
                      Positioned(
                        top:
                            16, // Position the button at the bottom of the image

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.white),
                              height: 48,
                              width: 88,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    size: 32,
                                    Icons.star,
                                    color: Color(0xffFFE100),
                                  ),
                                  Text(
                                    '3.8 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 228,
                            ),
                            IconButton(
                              onPressed: () {
                                // Action for the button
                              },
                              icon: Icon(
                                Icons.bookmark_outline, // Example icon
                                color: Colors.black87, // Set icon color
                              ),
                              iconSize: 32, // Adjust the icon size
                              splashRadius: 24, // Set the splash effect radius
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors
                                      .white54), // Semi-transparent background
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'UI UX Diploma',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '4500',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff088395)),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Instructor',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Image.asset('images/courses/aref.png'),
                title: Text(
                  'Mohammed Aref',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Instructor at route academy',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                trailing: SizedBox(
                  width: 98,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Color(0xffEEEEEE)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.message_outlined,
                            color: Color(
                              0xff088395,
                            ),
                          )),
                      IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Color(0xffEEEEEE)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone_outlined,
                            color: Color(
                              0xff088395,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Divider(
                color: Color(0xffEEEEEE),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ReadMoreDescription(
                description:
                    'Unlock the world of user-centric design with our comprehensive UI/UX Design Course! This course is tailored for aspiring designers, developers, and anyone passionate about crafting intuitive and engaging digital experiences. You\'ll learn the fundamentals of user interface (UI) design and user experience (UX) principles, exploring tools like Figma and Adobe XD to create wireframes, prototypes, and mockups. Dive into the psychology of design, usability testing, and responsive design techniques to ensure your creations resonate across all devices. By the end of this course, you\'ll have a polished portfolio of projects, showcasing your ability to design visually appealing and user-friendly websites and mobile applications. Whether you\'re starting from scratch or enhancing your current skills, this course will elevate your design journey.What You’ll Learn: Design principles and color theory Wireframing and prototyping User research and persona creation Usability testing and feedback integration Responsive design for web and mobile Who This Course is For: Beginners, developers, and professionals aiming to transition into the design field or improve their skills in crafting exceptional digital experiences.',
              ),
              Divider(
                color: Color(0xffEEEEEE),
              ),
              const SizedBox(
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
                      minimumSize: const Size(120, 44),
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
                      'Roadmap',
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
                      minimumSize: const Size(120, 44),
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
                    child:
                        const Text('Reviews', style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedButton == 3
                          ? Colors.white
                          : const Color(0xff088395),
                      backgroundColor: selectedButton == 3
                          ? const Color(0xff088395)
                          : Colors.white,
                      minimumSize: const Size(120, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: Color(0xff088395),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedButton = 3; // Select the second button
                      });
                    },
                    child: const Text('Mentor', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (selectedButton == 1)
                SizedBox(
                  height: 800,
                  child: ListView.builder(
                    itemCount: 10,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: ListTile(
                          leading: Text(
                            '01',
                            style: TextStyle(
                                fontSize: 42,
                                color: Color(0xff999999),
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'Session 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Subtitle'),
                          trailing: IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: Color(0xff088395)),
                              onPressed: () {},
                              icon: Icon(
                                Icons.file_copy_outlined,
                                color: Colors.white,
                              )),
                        ),
                      );
                    },
                  ),
                ),
              if (selectedButton == 2)
                SizedBox(
                  height: 800,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFE100),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFE100),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFE100),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFE100),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              Text('01/07/2024')
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Simple explanation of the information and constant follow-up and training on practical projects',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'By Mohammed Nasser',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 180,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 28,
                        ),
                        Button(
                          borderColor: Colors.white,
                          onClick: () {},
                          text: 'Book Now',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Button(
                          onClick: () {},
                          text: 'Add to favorite',
                          color: Colors.white,
                          textColor: Color(0xff071952),
                        ),

                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(context, MaterialPageRoute(
                        //       builder: (context) {
                        //         return SignIn();
                        //       },
                        //     ));
                        //   },
                        //   child: Container(
                        //     height: 44,
                        //     width: 360,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.white),
                        //         borderRadius: BorderRadius.circular(8),
                        //         color: const Color(0xff071952)),
                        //     child: const Center(
                        //       child: Text(
                        //         'Sign in',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w700),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
