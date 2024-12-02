import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/sign_in.dart';

class Button extends StatelessWidget {
  final VoidCallback onClick;
  final double height;
  final double width;
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;

  const Button(
      {super.key,
      required this.onClick,
      this.height = 52,
      this.width = 380,
      required this.text,
      this.color = const Color(0xff071952),
      this.textColor = Colors.white,
      this.borderColor = const Color(0xff071952)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor, strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(8),
            color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
