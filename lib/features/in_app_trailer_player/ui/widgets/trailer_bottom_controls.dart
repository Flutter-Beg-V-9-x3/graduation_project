import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerBottomControls extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onVolumeToggle;
  final VoidCallback onToggleFullscreen;

  const TrailerBottomControls({
    required this.controller,
    required this.onVolumeToggle,
    required this.onToggleFullscreen,
    Key? key,
  }) : super(key: key);

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (_, value, __) => Text(
                    _formatDuration(value.position),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: VideoProgressIndicator(
                    controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: Colors.purple,
                      bufferedColor: Colors.white38,
                      backgroundColor: Colors.white12,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6),
                  ),
                ),
                const SizedBox(width: 8),
                ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (_, value, __) => Text(
                    _formatDuration(value.duration),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    controller.value.volume > 0
                        ? Icons.volume_up
                        : Icons.volume_off,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: onVolumeToggle,
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.closed_caption,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('الترجمة غير متوفرة حالياً'),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.replay_10,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    final newPos =
                        controller.value.position - const Duration(seconds: 10);
                    controller.seekTo(
                      newPos > Duration.zero ? newPos : Duration.zero,
                    );
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  iconSize: 64,
                  icon: Icon(
                    controller.value.isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.forward_10,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    final newPos =
                        controller.value.position + const Duration(seconds: 10);
                    controller.seekTo(newPos);
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('إعدادات التشغيل قريباً')),
                    );
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? Icons.fullscreen_exit
                        : Icons.fullscreen,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: onToggleFullscreen,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
