import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/features/introscreens/presentation/reset_password.dart';
import 'package:rafiq_application/widgets/OTPfields.dart';
import 'package:rafiq_application/widgets/button.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title == "Verify OTP" ? 'Verify OTP ' : 'Verify Password',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title == 'Verify OTP'
                  ? Center(
                      child: SvgPicture.asset(
                        "images/logins/otp_security.svg",
                        height: 343,
                        width: 343,
                      ),
                    )
                  : Center(
                      child: SvgPicture.asset(
                        "images/logins/palm_recognition.svg",
                        height: 343,
                        width: 343,
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Check Your email',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              const Text(
                'We’ve send code to your email',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff999999)),
              ),
              const SizedBox(
                height: 20,
              ),
              OTPInput(),
              const Text(
                'Resend Code in ',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff999999)),
              ),
              const SizedBox(
                height: 20,
              ),
              title == 'Verify OTP'
                  ? Button(onClick: () {}, text: 'Verify OTP')
                  : Button(
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPassword(),
                            ));
                      },
                      text: 'Verify OTP'),
              const SizedBox(
                height: 12,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t receive code ? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff999999)),
                  ),
                  Text(
                    'Resend code',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff071952)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
