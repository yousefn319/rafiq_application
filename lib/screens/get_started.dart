import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/screens/sign_in.dart';
import 'package:rafiq_application/screens/sign_up.dart';
import 'package:vector_graphics/vector_graphics.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    FilledButton ButtonSignUp = FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: theme.colorScheme.onPrimary,
            foregroundColor: theme.colorScheme.primary),
        child: const Text('Sign up'),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignupForm())));
    FilledButton ButtonSignIn = FilledButton(
        style: FilledButton.styleFrom(
            side: BorderSide(color: theme.colorScheme.onPrimary)),
        child: const Text('Sign in'),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginForm())));
    FilledButton ButtonGoogle = FilledButton.icon(
        style: FilledButton.styleFrom(
            side: BorderSide(color: theme.colorScheme.onPrimary)),
        label: const Text('Continue with Google'),
        icon: const SvgPicture(
            AssetBytesLoader('images/buttons/Google-color.svg.vec'),
            width: 30,
            height: 30),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginForm())));

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Welcome')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
              child: SvgPicture(AssetBytesLoader('images/intros/5.svg.vec'))),
          Text('Let’s Start', style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            height: 250,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(children: [
                  const SizedBox(height: 32),
                  ButtonSignUp,
                  const SizedBox(height: 16),
                  ButtonSignIn,
                  const SizedBox(height: 16),
                  ButtonGoogle,
                ])),
          ),
        ],
      ),
    );
  }
}
