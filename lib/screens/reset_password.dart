import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:rafiq/widgets/typing_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  @override
  State<ResetPassword> createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  bool logout = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Reset password'), centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                const Center(
                    child: SvgPicture(AssetBytesLoader(
                        'images/logins/reset_password.svg.vec'))),
                const SizedBox(height: 16),
                const DefaultPassword(
                    label: 'Password',
                    autofillHints: [AutofillHints.newPassword],
                    textInputAction: TextInputAction.next),
                const SizedBox(height: 16),
                const DefaultPassword(
                    label: 'Confirm Password',
                    autofillHints: [AutofillHints.newPassword]),
                Row(children: [
                  Checkbox(
                      value: logout,
                      onChanged: (value) => setState(() => logout = value!)),
                  const Text('Log out From all devices')
                ]),
                FilledButton(
                    onPressed: () {}, child: const Text('Reset password'))
              ])),
        ));
  }
}
