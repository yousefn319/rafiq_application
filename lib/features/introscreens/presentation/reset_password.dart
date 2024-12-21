import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:rafiq_application/widgets/typing_field.dart';

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
              const Center(
                  child: SvgPicture(AssetBytesLoader(
                      'images/logins/reset_password.svg.vec'))),
              const SizedBox(height: 16),
              DefaultPassword(label: 'New Password'),
              const SizedBox(height: 16),
              DefaultPassword(label: 'Confirm Password'),
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
              //const SizedBox(height: 22),
              ElevatedButton(onPressed: () {}, child: Text('Save Password'))
            ],
          ),
        ),
      ),
    );
  }
}
