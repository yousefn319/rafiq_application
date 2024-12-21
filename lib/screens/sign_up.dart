import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/screens/otp_verification.dart';
import 'package:rafiq_application/screens/sign_in.dart';
import 'package:rafiq_application/widgets/date_of_birth.dart';
import 'package:rafiq_application/widgets/password_field.dart';
import 'package:rafiq_application/widgets/typing_field.dart';
import 'package:rafiq_application/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool agreeToTerms = false;
  final _formKey = GlobalKey<FormState>();
  PhonenumberController phoneController = PhonenumberController(null);

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
        appBar: AppBar(centerTitle: true, title: const Text("Sign up")),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  autofocus: true,
                  validator: (value) => EmailValidator.validate(value ?? "")
                      ? null
                      : "Invalid email",
                  decoration: const InputDecoration(
                      labelText: 'Name', prefixIcon: Icon(Icons.person))),
              const SizedBox(height: 16),
              TextFormField(
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Email', prefixIcon: Icon(Icons.email))),
              const SizedBox(height: 16),
              PhonenumberTextField(controller: phoneController),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'dd/mm/yyyy',
                    prefixIcon: const Icon(Icons.calendar_today),
                    suffixIcon: ExcludeFocus(
                        child: IconButton(
                      icon: const Icon(Icons.calendar_month),
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2101));
                      },
                    ))),
              ),
              const SizedBox(height: 16),
              DefaultPassword(
                  label: 'Password',
                  autofillHints: const [AutofillHints.newPassword],
                  textInputAction: TextInputAction.next),
              const SizedBox(height: 16),
              DefaultPassword(
                  label: 'Confirm Password',
                  autofillHints: const [AutofillHints.newPassword]),
              const SizedBox(height: 16),
              Row(children: [
                Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) =>
                        setState(() => agreeToTerms = value!)),
                Text('I accept the '),
                LabelButton(
                    label: 'Terms and Conditions',
                    onPressed: () {},
                    style: TextStyle(
                        color: Color(0xff088395),
                        decoration: TextDecoration.underline))
              ]),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: agreeToTerms
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtpVerification(
                                  title: Text("Verify Account"),
                                  image: SvgPicture(AssetBytesLoader(
                                      "images/logins/otp_security.svg.vec")))))
                      : null,
                  child: const Text('Sign up')),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Already have an account? ',
                ),
                LabelButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginForm())),
                    label: 'Sign in',
                    style: const TextStyle(color: Color(0xff088395))),
              ])
            ])));
  }
}
