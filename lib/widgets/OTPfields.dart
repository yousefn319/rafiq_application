import 'package:flutter/material.dart';

class OTPInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOTPField(context),
        const SizedBox(width: 10),
        _buildOTPField(context),
        const SizedBox(width: 10),
        _buildOTPField(context),
        const SizedBox(width: 10),
        _buildOTPField(context),
      ],
    );
  }

  Widget _buildOTPField(BuildContext context) {
    return Container(
      width: 77, // Width of each square
      height: 77, // Height of each square
      child: TextFormField(
        cursorColor: Color(0xff088395),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1, // Only one digit per field
        decoration: InputDecoration(
          counterText: '', // Hide the character counter
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xff088395), width: 2.0),
          ),
        ),
        style: const TextStyle(fontSize: 24), // Adjust font size as needed
        onChanged: (value) {
          if (value.length == 1) {
            // Automatically move to the next field
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
