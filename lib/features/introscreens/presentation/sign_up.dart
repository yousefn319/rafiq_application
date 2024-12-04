import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/sign_in.dart';
import 'package:rafiq_application/features/introscreens/presentation/signup/signup_screen.dart';
import 'package:rafiq_application/widgets/button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign up',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 350,
          ),
          Center(
            child: SizedBox(
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    onClick: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen(
                            type: 'Student',
                          );
                        },
                      ));
                    },
                    text: 'As Student',
                    width: 180,
                  ),
                  Button(
                    onClick: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen(
                            type: 'Instructor',
                          );
                        },
                      ));
                    },
                    text: 'As Instructor',
                    width: 180,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have any account?',
                style: TextStyle(
                    color: Color(0xff7F7F7F),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    ' Sign in',
                    style: TextStyle(
                        color: Color(0xff088395),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
