import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/screens/otp_verification.dart';
import 'package:vector_graphics/vector_graphics.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: SvgPicture(
                const AssetBytesLoader("images/logins/forgotpassword.svg.vec"),
                height: screenHeight * 0.5,
                width: screenWidth * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Check Your email',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            const Text(
              'We’ll send code to your email',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff999999)),
            ),
            SizedBox(height: screenHeight * 0.032),
            const TextField(decoration: InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpVerification(
                            title: Text(
                          'Reset Password',
                        )),
                      ));
                },
                child: const Text('Send Code'))
          ]),
        ),
      ),
    );
  }
}
