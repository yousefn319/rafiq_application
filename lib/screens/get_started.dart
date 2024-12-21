import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq_application/screens/sign_in.dart';
import 'package:rafiq_application/screens/sign_up.dart';
import 'package:vector_graphics/vector_graphics.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    FilledButton ButtonSignUp = FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: theme.colorScheme.onPrimary,
            foregroundColor: theme.colorScheme.primary),
        child: const Text('Sign up'),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignUp())));
    FilledButton ButtonSignIn = FilledButton(
        style: FilledButton.styleFrom(
            side: BorderSide(color: theme.colorScheme.onPrimary)),
        child: const Text('Sign in'),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginForm())));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Get started'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(child: SvgPicture(AssetBytesLoader('images/intros/5.svg.vec'))),
          Text('Let’s Start', style: theme.textTheme.titleMedium),
          const SizedBox(height: 32),
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
                  ButtonSignIn
                ])),
          ),
        ],
      ),
    );
  }
}
