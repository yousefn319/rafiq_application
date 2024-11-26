import 'package:flutter/material.dart';

List<int> colorindex = [];

class Interest extends StatefulWidget {
  Interest({super.key, required this.interest, required this.color});

  String interest;
  Color color;

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 31,
        decoration: BoxDecoration(
          color: const Color(0xffC1C1C1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: Text(
          widget.interest,
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.w600, fontSize: 12),
        )),
      ),
    );
  }
}
