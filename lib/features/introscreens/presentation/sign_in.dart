import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/Sign_up.dart';
import 'package:rafiq_application/widgets/button.dart';
import 'package:rafiq_application/widgets/typing_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign in',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 88,
          ),
          Center(
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
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
          const SizedBox(
            width: 380,
            height: 30,
            child: Row(
              children: [
                Text('Email',
                    style: TextStyle(
                        color: Color(0xff071952), fontWeight: FontWeight.w600))
              ],
            ),
          ),
          TypingField(
              controller: emailController,
              type: TextInputType.emailAddress,
              icon: const Icon(Icons.email_outlined),
              label: 'Email'),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 380,
            height: 30,
            child: Row(
              children: [
                Text('Password',
                    style: TextStyle(
                        color: Color(0xff071952), fontWeight: FontWeight.w600))
              ],
            ),
          ),
          TypingField(
              controller: passwordController,
              type: TextInputType.visiblePassword,
              icon: const Icon(Icons.lock_outline_rounded),
              label: 'Password'),
          SizedBox(
            width: 380,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text('Forgot Password ? ',
                      style: TextStyle(
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Button(
              onClick: () {
                print('Email: ${emailController.text}');
                print('Password: ${passwordController.text}');
              },
              text: 'Sign in'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have any account?',
                style: TextStyle(
                    color: Color(0xff7F7F7F),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SignUp();
                      },
                    ));
                  },
                  child: const Text(
                    ' Sign up',
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
