import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/second_intro.dart';
import 'package:rafiq_application/widgets/intro.dart';

class FirstIntro extends StatelessWidget {
  const FirstIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Intro(
          image: 'images/intros/1.svg',
          title: 'Choose your courses easily',
          subTitle: 'Choose your courses easily and add it to favorite',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const SecondIntro();
              },
            ));
          },
        ));
  }
}
