import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/language_selection.dart';
import 'package:rafiq_application/widgets/intro.dart';

class ThirdIntro extends StatelessWidget {
  const ThirdIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Intro(
          image: 'images/intros/3.svg',
          title: 'Learn easily and anytime!',
          subTitle:
              'With video lessons, interactive tests, and certified certificates.',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const LanguageSelection();
              },
            ));
          },
        ));
  }
}
