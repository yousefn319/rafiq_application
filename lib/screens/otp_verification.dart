import 'package:flutter/material.dart';
import 'package:rafiq_application/screens/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rafiq_application/widgets/resend_code_widget.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key, required this.title, this.image});
  final Widget title;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          Center(child: image),
          const SizedBox(height: 32),
          Text('Check your email', style: theme.textTheme.titleMedium),
          const Text('We’ve sent the code to your email'),
          const SizedBox(height: 16),
          PinCodeTextField(
              appContext: context,
              length: 6,
              pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(8),
                  shape: PinCodeFieldShape.box),
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade),
          const SizedBox(height: 16),
          FilledButton(
              child: const Text('Verify'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassword()))),
          const SizedBox(height: 8),
          ResendCodeWidget(onPressed: () {}),
          //Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //  Text('Didn\'t receive your code? '),
          //  LabelButton(
          //      label: 'Resend',
          //      onPressed: () {},
          //      style: TextStyle(color: theme.colorScheme.secondary)), // hmm??
          //])
        ]),
      ),
    );
  }
}
