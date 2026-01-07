import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const TrailerVideoPlayer({required this.controller, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
          : const CircularProgressIndicator(color: Colors.purple),
    );
  }
}
