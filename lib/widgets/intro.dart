import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Intro extends StatelessWidget {
  Intro(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onTap});
  String title;
  String subTitle;
  String image;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
          child: SvgPicture.asset(
            image,
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
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
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
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 44,
            width: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff071952)),
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )
      ],
    );
  }
}
