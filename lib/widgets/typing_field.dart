import 'package:flutter/material.dart';

class TypingField extends StatelessWidget {
  TypingField(
      {super.key,
      required this.controller,
      required this.type,
      required this.icon,
      required this.label});

  TextEditingController controller;
  TextInputType type;
  String label;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 380,
      child: TextField(
        controller: controller,
        cursorColor: const Color(0xff071952),
        decoration: InputDecoration(
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: const TextStyle(color: Color(0xff999999)),
            prefixIconColor: const Color(0xff999999),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            prefixIcon: icon,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xff071952),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                gapPadding: BorderSide.strokeAlignCenter,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: Color(0xff071952),
                ))),
        keyboardType: type,
      ),
    );
  }
}
