import 'package:flutter/material.dart';
import 'package:rafiq_application/features/introscreens/presentation/first_intro.dart';
import 'package:rafiq_application/features/introscreens/presentation/home_screen.dart';
import 'package:rafiq_application/features/introscreens/presentation/signup/signup_screen.dart';

void main() {
  runApp(const RafiqApp());
}

class RafiqApp extends StatelessWidget {
  static double ui_width = 375;
  static double ui_height = 943;
  const RafiqApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const FirstIntro(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, // Default AppBar background color
            elevation: 0, // Remove shadow (optional)
            iconTheme: IconThemeData(color: Colors.black), // Icon color
            titleTextStyle: TextStyle(
              color: Colors.black, // Title text color
              fontSize: 22, // Adjust font size (optional)
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
