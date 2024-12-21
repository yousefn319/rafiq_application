import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/screens/sign_in.dart';
import 'package:rafiq_application/screens/signup_screen.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    ElevatedButton ButtonSignUp = ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.white,
            foregroundColor: Color(0xff071952)),
        child: Text('Sign up'),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignUp())));
    ElevatedButton ButtonSignIn = ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            side: BorderSide(color: Colors.white)),
        child: Text('Sign in'),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginForm())));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Get started',
            style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('images/intros/5.svg'),
          const Text('Let’s Start',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          Container(
              decoration: const BoxDecoration(
                  color: Color(0xff071952),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              width: double.infinity,
              height: 300,
              child: Center(
                  child: SizedBox(
                      width: 360,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ButtonSignUp, ButtonSignIn],
                      )))),
        ],
      ),
    );
  }
}
