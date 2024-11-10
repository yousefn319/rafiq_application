import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/third_intro.dart';
import 'package:rafiq_application/widgets/intro.dart';

class SecondIntro extends StatelessWidget {
  const SecondIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Intro(
          image: 'images/intros/2.svg',
          title: 'Book your courses at any time',
          subTitle: 'Choose your courses easily and add it to favorite',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ThirdIntro();
              },
            ));
          },
        ));
  }
}
