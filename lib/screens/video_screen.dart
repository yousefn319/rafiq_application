import 'package:flutter/material.dart';
import 'package:rafiq_application/widgets/video.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Video(
          videoUrl: 'https://www.w3schools.com/html/mov_bbb.mp4',
        ),
      ),
    );
  }
}
