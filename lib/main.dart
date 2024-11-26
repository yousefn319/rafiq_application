import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/first_intro.dart';

void main() {
  runApp(const RafiqApp());
}

class RafiqApp extends StatelessWidget {
  static double ui_width = 375;
  static double ui_height = 943;
  const RafiqApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstIntro(),
    );
  }
}
