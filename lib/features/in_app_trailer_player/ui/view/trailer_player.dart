import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_graduation_project/features/in_app_trailer_player/ui/widgets/trailer_bottom_controls.dart';
import 'package:flutter_graduation_project/features/in_app_trailer_player/ui/widgets/trailer_center_button.dart';
import 'package:flutter_graduation_project/features/in_app_trailer_player/ui/widgets/trailer_top_controls.dart';
import 'package:flutter_graduation_project/features/in_app_trailer_player/ui/widgets/trailer_video_player.dart';
import 'package:video_player/video_player.dart';
import 'dart:html' as html;

class TrailerPlayer extends StatefulWidget {
  final String videoUrl;
  final String posterUrl;
  final String? title;

  const TrailerPlayer({
    required this.videoUrl,
    required this.posterUrl,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<TrailerPlayer> createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  final Duration _hideTimerDuration = const Duration(seconds: 4);

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        _resetHideTimer();
      }
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _resetHideTimer() {
    setState(() => _showControls = true);
    Future.delayed(_hideTimerDuration, () {
      if (mounted && _controller.value.isPlaying) {
        setState(() => _showControls = false);
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
      if (_showControls) _resetHideTimer();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      MediaQuery.of(context).orientation == Orientation.landscape
          ? SystemUiMode.immersiveSticky
          : SystemUiMode.edgeToEdge,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: MediaQuery.of(context).orientation == Orientation.portrait,
        top: MediaQuery.of(context).orientation == Orientation.portrait,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/3.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            TrailerVideoPlayer(controller: _controller),

            GestureDetector(
              onTap: _toggleControls,
              behavior: HitTestBehavior.opaque,
            ),

            AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Stack(
                children: [
                  TrailerTopControls(
                    title: 'THE BATMAN',
                    subtitle: 'Official Trailer',
                    onBack: () => Navigator.pop(context),
                    onCast: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Casting implemented')),
                      );
                    },
                  ),

                  TrailerBottomControls(
                    controller: _controller,
                    onVolumeToggle: () {
                      setState(() {
                        _controller.setVolume(
                          _controller.value.volume > 0 ? 0.0 : 1.0,
                        );
                      });
                    },
                    onToggleFullscreen: () async {
                      if (kIsWeb) {
                        final element = html.document.documentElement;
                        if (html.document.fullscreenElement == null) {
                          await element?.requestFullscreen();
                        } else {
                          html.document.exitFullscreen();
                        }
                      } else {
                        if (MediaQuery.of(context).orientation ==
                            Orientation.portrait) {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.landscapeLeft,
                            DeviceOrientation.landscapeRight,
                          ]);
                          SystemChrome.setEnabledSystemUIMode(
                            SystemUiMode.immersiveSticky,
                          );
                        } else {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                          ]);
                          SystemChrome.setEnabledSystemUIMode(
                            SystemUiMode.edgeToEdge,
                          );
                        }
                      }
                    },
                  ),

                  TrailerCenterPlayButton(
                    controller: _controller,
                    onPlay: () {
                      _controller.play();
                      _resetHideTimer();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
