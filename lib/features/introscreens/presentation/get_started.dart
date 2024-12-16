import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/features/introscreens/presentation/sign_in.dart';
import 'package:rafiq_application/features/introscreens/presentation/sign_up.dart';
import 'package:rafiq_application/widgets/button.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Get started',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 240),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/intros/5.svg',
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.4,
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  const Text(
                    'Let’s Start',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Text(
                    'Fill your information below to create it',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff071952),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                width: double.infinity,
                height: screenHeight * 0.28,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Button(
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        text: 'Sign up',
                        color: Colors.white,
                        textColor: const Color(0xff071952),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Button(
                        borderColor: Colors.white,
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignIn(),
                              ));
                        },
                        text: 'Sign in',
                      )
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
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
