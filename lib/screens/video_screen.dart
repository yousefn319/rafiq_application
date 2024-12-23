import 'package:flutter/material.dart';
import 'package:rafiq/widgets/video.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session 1'),
        centerTitle: true,
      ),
      body: const Center(
        child: Video(
          videoUrl: 'https://www.w3schools.com/html/mov_bbb.mp4',
        ),
      ),
    );
  }
}
