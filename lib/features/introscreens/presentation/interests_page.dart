import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_application/widgets/interest.dart';

int clicked = 1;

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Determine interests',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SvgPicture.asset(
                    'images/intros/tick_square.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
                const Text(
                  'Let’s find out your tastes',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 5,
                      mainAxisSpacing: 20),
                  itemCount: 26,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 30,
                        child: GestureDetector(
                            onTap: () {
                              if (clicked == 0) {
                                setState(() {
                                  clicked = 1;
                                });
                              } else {
                                setState(() {
                                  clicked = 0;
                                });
                              }
                            },
                            child: clicked == 0
                                ? Interest(
                                    interest: 'interest',
                                    color: Colors.red,
                                  )
                                : Interest(
                                    interest: 'interest',
                                    color: Colors.blue,
                                  )));
                  }),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Interest(interest: 'interest'),
            //     Interest(interest: 'interest'),
            //     Interest(interest: 'interest'),
            //     Interest(interest: 'interest'),
            //   ],
            // ),

            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 44,
                width: 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff071952)),
                child: const Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
