import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerCenterPlayButton extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onPlay;

  const TrailerCenterPlayButton({
    required this.controller,
    required this.onPlay,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.value.isPlaying || !controller.value.isInitialized) {
      return const SizedBox.shrink();
    }

    return Center(
      child: IconButton(
        iconSize: 90,
        icon: const Icon(Icons.play_circle_fill, color: Colors.purple),
        onPressed: onPlay,
      ),
    );
  }
}
