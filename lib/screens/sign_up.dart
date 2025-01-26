import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/screens/otp_verification.dart';
import 'package:rafiq/screens/sign_in.dart';
import 'package:rafiq/widgets/phonenumber_field.dart';
import 'package:rafiq/widgets/password_field.dart';
import 'package:rafiq/widgets/label_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rafiq/user.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool agreeToTerms = false;
  final _formKey = GlobalKey<FormState>();
  PhonenumberController phoneController = PhonenumberController(null);
  late final TextEditingController firstnameController =
      TextEditingController();
  late final TextEditingController lastnameController = TextEditingController();
  late final TextEditingController dobController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  Future? _signUp;
  DateTime? selectedDate;

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    dobController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Sign up")),
        body: Form(
            child: FutureBuilder(
                future: _signUp,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return const CircularProgressIndicator();
                  }
                  return SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: AutofillGroup(
                          child: Column(spacing: 16, children: [
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r"\s"))
                            ],
                            validator: (val) => val!.isEmpty
                                ? 'Please enter your first name'
                                : null,
                            controller: firstnameController,
                            autofocus: true,
                            decoration: const InputDecoration(
                                labelText: 'First Name',
                                prefixIcon: Icon(Icons.person))),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r"\s"))
                            ],
                            validator: (val) => val!.isEmpty
                                ? 'Please enter your last name'
                                : null,
                            controller: lastnameController,
                            autofocus: true,
                            decoration: const InputDecoration(
                                labelText: 'Last Name',
                                prefixIcon: Icon(Icons.person))),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.email],
                            controller: emailController,
                            validator: (value) =>
                                EmailValidator.validate(value ?? "")
                                    ? null
                                    : "Invalid email",
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email))),
                        PhonenumberTextField(controller: phoneController),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.datetime,
                            validator: (value) => selectedDate == null
                                ? 'Please enter your date of birth'
                                : null,
                            controller: dobController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2101));
                              if (picked != null) {
                                selectedDate = picked;
                                dobController.text =
                                    DateFormat('yyyy/MM/dd').format(picked);
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Date of Birth',
                                prefixIcon: const Icon(Icons.calendar_today),
                                suffixIcon: const Icon(Icons.calendar_month))),
                        DefaultPassword(
                            label: 'Password',
                            controller: passwordController,
                            autofillHints: [AutofillHints.newPassword],
                            textInputAction: TextInputAction.next),
                        DefaultPassword(
                            label: 'Confirm Password',
                            autofillHints: [AutofillHints.newPassword],
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            }),
                        Row(children: [
                          Checkbox(
                              value: agreeToTerms,
                              onChanged: (value) =>
                                  setState(() => agreeToTerms = value!)),
                          const Text('I accept the '),
                          LabelButton(
                              label: 'Terms and Conditions',
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Terms and Conditions'),
                                        content: const SingleChildScrollView(
                                            child: Text(
                                                'Lorum ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec nulla ac')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Close'))
                                        ],
                                      );
                                    });
                              },
                              style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                  decoration: TextDecoration.underline))
                        ]),
                        FilledButton(
                            onPressed: agreeToTerms
                                ? () {
                                    if (Form.of(context).validate()) {
                                      print('Email: ${emailController.text}');
                                      print(
                                          'Password: ${passwordController.text}');
                                      _signUp = context.read<UserRepository>()!.signup(
                                          firstnameController.text,
                                          lastnameController.text,
                                          selectedDate!,
                                          phoneController.value!['region_code']!,
                                          phoneController.value!['e164']!,
                                          emailController.text,
                                          passwordController.text);
                                    }
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => const OtpVerification(
                                    //           title: Text("Verify Account"),
                                    //           image: SvgPicture(AssetBytesLoader(
                                    //               "images/logins/otp_security.svg.vec")))))
                                  }
                                : null,
                            child: const Text('Sign up')),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account? '),
                              LabelButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginForm())),
                                  label: 'Sign in',
                                  style: TextStyle(
                                      color: theme.colorScheme.secondary)),
                            ])
                      ])));
                })));
  }
}
