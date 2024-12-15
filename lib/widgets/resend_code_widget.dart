import 'dart:async';
import 'package:flutter/material.dart';

class ResendCodeWidget extends StatefulWidget {
  @override
  _ResendCodeWidgetState createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  int _secondsRemaining = 60;
  bool _isResendAllowed = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 60;
      _isResendAllowed = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isResendAllowed = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onResendCode() {
    if (_isResendAllowed) {
      // Logic to resend the code
      print("Code resent!");
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Didn’t receive code? ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff999999),
          ),
        ),
        GestureDetector(
          onTap: _isResendAllowed ? _onResendCode : null,
          child: Text(
            'Resend code',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: _isResendAllowed
                  ? const Color(0xff071952)
                  : const Color(0xffd0d0d0), // Greyed out when disabled
            ),
          ),
        ),
        Text(
          ' in ${_secondsRemaining}s',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff999999),
          ),
        ),
      ],
    );
  }
}
