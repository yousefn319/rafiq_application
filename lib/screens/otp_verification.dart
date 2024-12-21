import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/screens/reset_password.dart';
import 'package:rafiq_application/widgets/OTPfields.dart';
import 'package:rafiq_application/widgets/resend_code_widget.dart';
import 'package:vector_graphics/vector_graphics.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key, required this.title});
  final String title;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title == "Verify OTP" ? 'Verify OTP ' : 'Verify Password',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SvgPicture(AssetBytesLoader(widget.title == 'Verify OTP'
                      ? "images/logins/otp_security.svg.vec"
                      : "images/logins/palm_recognition.svg.vec"))),
              const SizedBox(
                height: 34,
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
                height: 24,
              ),
              OTPInput(),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50)),
                  child: Text('Verify OTP'),
                  onPressed: widget.title == 'Verify OTP'
                      ? () {}
                      : () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPassword(),
                          ))),
              const SizedBox(
                height: 16,
              ),
              ResendCodeWidget()
            ],
          ),
        ),
      ),
    );
  }
}
