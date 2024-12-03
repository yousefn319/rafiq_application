import 'package:flutter/material.dart';

class TypingField extends StatelessWidget {
  TypingField(
      {super.key,
      // required this.controller,
      required this.type,
      this.icon,
      required this.label,
      this.secure = false,
      this.prefixNum});

  // TextEditingController controller;
  TextInputType type;
  String label;
  Icon? icon;
  bool secure = false;
  Widget? prefixNum;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff088395),
      obscureText: secure,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: label,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
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
            color: Color(0xff088395),
          ),
        ),
        prefix: prefixNum,
        suffixIcon: icon,
      ),
      keyboardType: type,
    );
  }
}
