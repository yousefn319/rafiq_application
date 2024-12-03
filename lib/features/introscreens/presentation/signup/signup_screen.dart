import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/otp_verification.dart';
import 'package:rafiq_application/features/introscreens/presentation/sign_in.dart';
import 'package:rafiq_application/widgets/typing_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
  final String type;

  const SignUpScreen({super.key, required this.type});
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text("${widget.type}"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity,
                height: 32,
                child: Row(children: [
                  Text('Name',
                      style: TextStyle(
                          color: Color(0xff071952),
                          fontWeight: FontWeight.w600))
                ])),
            TypingField(
              type: TextInputType.name,
              label: 'Name',
            ),
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity,
                height: 32,
                child: Row(children: [
                  Text('Email',
                      style: TextStyle(
                          color: Color(0xff071952),
                          fontWeight: FontWeight.w600))
                ])),
            TypingField(
              type: TextInputType.emailAddress,
              label: 'Email',
            ),
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity,
                height: 32,
                child: Row(children: [
                  Text('Phone',
                      style: TextStyle(
                          color: Color(0xff071952),
                          fontWeight: FontWeight.w600))
                ])),
            TypingField(
              type: TextInputType.phone,
              label: 'Phone',
              prefixNum: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text('EG'),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              height: 32,
              child: Row(
                children: [
                  Text('Date',
                      style: TextStyle(
                          color: Color(0xff071952),
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            TextField(
              cursorColor: Color(0xff088395),
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xff071952),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    gapPadding: BorderSide.strokeAlignCenter,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Color(0xff088395),
                    )),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () {
                // Show date picker
              },
            ),
            widget.type == 'Instructor'
                ? const SizedBox(height: 16)
                : SizedBox(),
            widget.type == 'Instructor'
                ? const SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: Row(
                      children: [
                        Text('Gender',
                            style: TextStyle(
                                color: Color(0xff071952),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  )
                : const SizedBox(),
            widget.type == 'Instructor'
                ? DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xff071952),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: BorderSide.strokeAlignCenter,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xff088395),
                          )),
                    ),
                    items: ['Male', 'Female', 'Other']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  )
                : const SizedBox(),
            widget.type == 'Instructor'
                ? const SizedBox(height: 16)
                : SizedBox(),
            widget.type == 'Instructor'
                ? const SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: Row(
                      children: [
                        Text('CV',
                            style: TextStyle(
                                color: Color(0xff071952),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  )
                : const SizedBox(),
            widget.type == 'Instructor'
                ? const TextField(
                    cursorColor: Color(0xff088395),
                    decoration: InputDecoration(
                      labelText: 'CV',
                      hintText: 'Attach your file here',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xff071952),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: BorderSide.strokeAlignCenter,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color(0xff088395),
                          )),
                      suffixIcon: Icon(Icons.attach_file),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              height: 32,
              child: Row(
                children: [
                  Text('Password',
                      style: TextStyle(
                          color: Color(0xff071952),
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            TypingField(
              type: TextInputType.visiblePassword,
              label: 'Password',
              secure: true,
              icon: const Icon(Icons.visibility),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              height: 32,
              child: Row(
                children: [
                  Text('Confirm Password',
                      style: TextStyle(
                          color: Color(0xff071952),
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            TypingField(
              type: TextInputType.visiblePassword,
              label: 'Confirm Password',
              secure: true,
              icon: const Icon(Icons.visibility),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  activeColor: Color(0xff071952),
                  value: agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      agreeToTerms = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'Agree with ',
                      children: [
                        TextSpan(
                          text: 'terms & Conditions',
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
              child: const Center(child: Text('Sign up')),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Color(0xff071952)),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
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
