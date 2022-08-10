import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:video_player/video_player.dart';

import '../utils/constants.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({Key? key}) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with TickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isPlay = true;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    initVideoPlayer();
  }

  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _animationController.dispose();
  }

  void onTapPause() {
    if (_isPlay == false) {
      _animationController.forward();
      _isPlay = true;
    } else {
      _animationController.reverse();
      _isPlay = false;
    }
    _isPlay ? _chewieController!.pause() : _chewieController!.play();
  }

  Future<void> forward10Seconds() => goToPossition(
      (currentPosition) => currentPosition + const Duration(seconds: 10));

  Future<void> rewind10Seconds() => goToPossition(
      (currentPosition) => currentPosition - const Duration(seconds: 10));

  Future<void> goToPossition(
      Duration Function(Duration currentPosition) builder) async {
    final currentPosition = await _videoPlayerController.position;
    final newPosition = await builder(currentPosition!);

    await _videoPlayerController.seekTo(newPosition);
  }

  void initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      autoInitialize: true,
      zoomAndPan: true,
      allowedScreenSleep: false,
      allowFullScreen: true,
      allowMuting: false,
      showControls: true,
      cupertinoProgressColors: ChewieProgressColors(
        playedColor: const Color(0xFF8060FF),
      ),
      customControls: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onDoubleTap: rewind10Seconds,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(Ionicons.play_skip_back),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () => onTapPause(),
                      child: AnimatedIcon(
                        icon: AnimatedIcons.pause_play,
                        progress: _animationController,
                        size: 33,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Ionicons.play_skip_forward),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onDoubleTap: forward10Seconds,
                    ),
                  ),
                ],
              ),
              VideoProgressIndicator(
                _videoPlayerController,
                allowScrubbing: true,
                padding: const EdgeInsets.symmetric(vertical: 12.5),
                colors: VideoProgressColors(
                  backgroundColor: const Color(0xFFF2F2F2).withOpacity(0.8),
                  bufferedColor: kChapterActiveColor,
                  playedColor: kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _chewieController != null
            ? Chewie(controller: _chewieController!)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
