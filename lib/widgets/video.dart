import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String videoUrl;

  const Video({required this.videoUrl, super.key});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {}); // Refresh UI once the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (context) => FullScreenVideoPlayer(
            controller: _controller,
            isMuted: _isMuted,
            onPlayPause: _togglePlayPause,
            onMute: _toggleMute,
          ),
        ),
      )
          .then((_) {
        setState(() {
          _isFullScreen = false;
        });
      });
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_controller.value.isInitialized)
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              _ControlsOverlay(
                controller: _controller,
                onPlayPause: _togglePlayPause,
                onFullScreen: _toggleFullScreen,
                onMute: _toggleMute,
                isMuted: _isMuted,
              ),
            ],
          )
        else
          const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onPlayPause;
  final VoidCallback onFullScreen;
  final VoidCallback onMute;
  final bool isMuted;

  const _ControlsOverlay({
    required this.controller,
    required this.onPlayPause,
    required this.onFullScreen,
    required this.onMute,
    required this.isMuted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          colors: const VideoProgressColors(
            playedColor: Color(0xff088395),
            backgroundColor: Colors.grey,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: onPlayPause,
            ),
            Text(
              _formatDuration(controller.value.position),
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(
                isMuted ? Icons.volume_off : Icons.volume_up,
                color: Colors.white,
              ),
              onPressed: onMute,
            ),
            Text(
              _formatDuration(controller.value.duration),
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: const Icon(
                Icons.fullscreen,
                color: Colors.white,
              ),
              onPressed: onFullScreen,
            ),
          ],
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$minutes:$seconds';
  }
}

class FullScreenVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onPlayPause;
  final VoidCallback onMute;
  final bool isMuted;

  const FullScreenVideoPlayer({
    required this.controller,
    required this.onPlayPause,
    required this.onMute,
    required this.isMuted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
          _ControlsOverlay(
            controller: controller,
            onPlayPause: onPlayPause,
            onFullScreen: () => Navigator.pop(context),
            onMute: onMute,
            isMuted: isMuted,
          ),
        ],
      ),
    );
  }
}
