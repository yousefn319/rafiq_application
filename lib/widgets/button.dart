import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final VoidCallback onClick;
  final double height;
  final double width;
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;

  const Button({
    super.key,
    required this.onClick,
    this.height = 52,
    this.width = 380,
    required this.text,
    this.color = const Color(0xff071952),
    this.textColor = Colors.white,
    this.borderColor = const Color(0xff071952),
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.color; // Set initial color
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // Change color when the button is pressed
        setState(() {
          currentColor = widget.color.withOpacity(0.7); // Pressed color
        });
      },
      onTapUp: (_) {
        // Reset color when the button is released
        setState(() {
          currentColor = widget.color;
        });
        widget.onClick(); // Trigger the button's onClick function
      },
      onTapCancel: () {
        // Reset color if the tap is canceled
        setState(() {
          currentColor = widget.color;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), // Animation duration
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(8),
          color: currentColor,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
