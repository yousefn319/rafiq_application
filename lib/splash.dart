import 'package:flutter/material.dart';
import 'package:rafiq/screens/get_started.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/image/lodosplash.mp4')
      ..initialize().then((_) {
        // تشغيل الفيديو عند التحميل
        _controller.play();
        // الانتقال إلى الشاشة الرئيسية بعد انتهاء الفيديو
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GetStarted()),
            );
          }
        });
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _controller.value.isInitialized
              ? Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
