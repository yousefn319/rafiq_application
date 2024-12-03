import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_application/widgets/button.dart';

class Intro extends StatelessWidget {
  Intro(
      {super.key,
      this.image,
      this.text = 'Next',
      required this.title,
      required this.subTitle,
      required this.onTap});
  String title;
  String subTitle;
  String? image;
  VoidCallback onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: SvgPicture.asset(
                image ?? "images/intros/white.svg",
                height: 343,
                width: 343,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Button(onClick: onTap, text: text)
          ],
        ),
      ),
    );
  }
}
