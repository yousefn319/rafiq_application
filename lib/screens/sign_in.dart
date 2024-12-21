import 'package:flutter/material.dart';
import 'package:rafiq_application/screens/signup_screen.dart';
import 'package:rafiq_application/screens/home_screen.dart';
import 'package:rafiq_application/screens/otp_verification.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rafiq_application/widgets/typing_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Fill your information below to sign in',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff071952)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) => EmailValidator.validate(value ?? "")
                          ? null
                          : "Invalid email",
                      decoration: const InputDecoration(
                          labelText: 'Email', prefixIcon: Icon(Icons.email))),
                  const SizedBox(
                    height: 16,
                  ),
                  DefaultPassword(
                      controller: passwordController, label: 'Password'),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: const Text('Forgot Password?',
                          style: TextStyle(
                              color: Color(0xff999999),
                              fontWeight: FontWeight.w600)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const OtpVerification(title: "aqa"),
                            ));
                      },
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login successful!')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                          print('Email: ${emailController.text}');
                          print('Password: ${passwordController.text}');
                        }
                      },
                      child: Text('Sign in')),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: Color(0xff7F7F7F),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      LabelButton(
                        label: ' Sign up',
                        style: const TextStyle(
                            color: Color(0xff088395),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
