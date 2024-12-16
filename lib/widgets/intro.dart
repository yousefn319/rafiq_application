import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_application/widgets/button.dart';

class Intro extends StatelessWidget {
  Intro({
    super.key,
    this.image,
    this.text = 'Next',
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final String? image;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.06), // Dynamic padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1, // Adjusted spacing
            ),
            Center(
              child: SvgPicture.asset(
                image ?? "images/intros/white.svg",
                height: screenHeight * 0.35, // Adjusted image height
                width: screenWidth * 0.9, // Adjusted image width
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05, // Dynamic spacing
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.05, // Scaled font size
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01, // Dynamic spacing
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.04, // Scaled font size
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.08, // Adjusted spacing
            ),
            Button(onClick: onTap, text: text),
          ],
        ),
      ),
    );
  }
}
