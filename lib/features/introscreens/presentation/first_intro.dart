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
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SecondIntro(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // Horizontal Slide transition (slide beside each other)
                  const begin = Offset(1.0, 0.0); // Starts from the right
                  const end = Offset.zero; // Ends at the center
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );
          },
        ));
  }
}
