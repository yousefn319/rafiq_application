import 'package:flutter/material.dart';
import 'package:rafiq/screens/sign_up.dart';
import 'package:rafiq/screens/home_screen.dart';
import 'package:rafiq/screens/otp_verification.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rafiq/widgets/password_field.dart';
import 'package:rafiq/widgets/label_button.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Sign in')),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: AutofillGroup(
                  child: Column(children: [
                TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    autofocus: true,
                    controller: emailController,
                    validator: (value) => EmailValidator.validate(value ?? "")
                        ? null
                        : "Invalid email",
                    decoration: const InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Icons.email))),
                const SizedBox(height: 16),
                DefaultPassword(
                    controller: passwordController, label: 'Password'),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                    child: TextButton(
                      child: Text('Forgot Password?', style: theme.labelMedium),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtpVerification(
                                  title: Text("Reset password"),
                                  image: SvgPicture(AssetBytesLoader(
                                      "images/logins/palm_recognition.svg.vec"))))),
                    )),
                FilledButton(
                    child: const Text('Sign in'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                      if (_formKey.currentState!.validate()) {
                        print('Email: ${emailController.text}');
                        print('Password: ${passwordController.text}');
                      }
                    }),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account? '),
                  LabelButton(
                      label: 'Sign up',
                      style: const TextStyle(color: Color(0xff088395)),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupForm())))
                ])
              ])),
            )));
  }
}

