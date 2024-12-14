import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  String label;

  PasswordField({
    super.key,
    this.label = 'Password',
  });
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff088395),
      obscureText: _isObscured,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: widget.label,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xff071952),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xff088395),
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
