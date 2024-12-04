import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/widgets/button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Center(
                  child: SvgPicture.asset('images/logins/reset_password.svg')),
              const SizedBox(height: 16),
              const SizedBox(
                width: double.infinity,
                height: 32,
                child: Row(
                  children: [
                    Text('New Password',
                        style: TextStyle(
                            color: Color(0xff071952),
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              const TextField(
                cursorColor: Color(0xff088395),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
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
                  suffixIcon: Icon(Icons.visibility),
                ),
                keyboardType: TextInputType.visiblePassword,
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
              const TextField(
                cursorColor: Color(0xff088395),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
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
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xff071952),
                    value: const bool.hasEnvironment(AutofillHints.password),
                    onChanged: (value) {},
                  ),
                  const Text(
                    'Log out From all devices',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 22),
              Button(onClick: () {}, text: 'Save Password')
            ],
          ),
        ),
      ),
    );
  }
}
