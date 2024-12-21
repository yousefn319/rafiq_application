import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/screens/otp_verification.dart';
import 'package:rafiq_application/screens/sign_in.dart';
import 'package:rafiq_application/widgets/date_of_birth.dart';
import 'package:rafiq_application/widgets/password_field.dart';
import 'package:rafiq_application/widgets/typing_field.dart';
import 'package:rafiq_application/main.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool agreeToTerms = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ConfigProvider config = ConfigProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextFormField(
                keyboardType: TextInputType.name,
                validator: (value) => EmailValidator.validate(value ?? "")
                    ? null
                    : "Invalid email",
                decoration: const InputDecoration(
                    labelText: 'Name', prefixIcon: Icon(Icons.person))),
            const SizedBox(height: 16),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Email', prefixIcon: Icon(Icons.email))),
            const SizedBox(height: 16),
            PhonenumberTextField(controller: phoneController),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  hintText: 'dd/mm/yyyy',
                  prefixIcon: const Icon(Icons.calendar_today),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101));
                    },
                  )),
            ),
            const SizedBox(height: 16),
            DefaultPassword(label: 'Password'),
            const SizedBox(height: 16),
            DefaultPassword(label: 'Confirm Password'),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  // activeColor: const Color(0xff071952),
                  value: agreeToTerms,
                  onChanged: (value) => setState(() => agreeToTerms = value!),
                ),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'I accept the ',
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            color: Color(0xff088395),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: agreeToTerms
                  ? () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const OtpVerification(
                            title: "Verify OTP",
                          );
                        },
                      ));
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color(0xff071952)),
              child: const Center(child: Text('Sign up')),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginForm()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(color: Color(0xff088395)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
