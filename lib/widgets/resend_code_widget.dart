import 'dart:async';
import 'package:rafiq/widgets/typing_field.dart';
import 'package:flutter/material.dart';

class ResendCodeWidget extends StatefulWidget {
  ResendCodeWidget(
      {super.key,
      required this.onPressed,
      this.label = 'Resend',
      this.timeout = 60});
  void Function()? onPressed;
  int timeout;
  String label;
  @override
  _ResendCodeWidgetState createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  late int _secondsRemaining;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() => _secondsRemaining = widget.timeout);
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) => _secondsRemaining > 0 && this.mounted
            ? setState(() => _secondsRemaining--)
            : timer.cancel());
  }

  void _pressed() {
    _startTimer();
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return LabelButton(
        label: _secondsRemaining > 0
            ? '${widget.label} (${_secondsRemaining}s)'
            : widget.label,
        onPressed: _secondsRemaining > 0 ? null : _pressed,
        style: TextStyle(color: theme.colorScheme.secondary));
  }
}
