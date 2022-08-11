import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:project_lagann/widgets/custom_controls.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({Key? key}) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  void enterFullScr() {
    _chewieController!.enterFullScreen();
  }

  void initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      autoInitialize: true,
      allowedScreenSleep: true,
      allowFullScreen: true,
      allowMuting: false,
      showControls: true,
      customControls: CustomConstrols(
        enterFullScr,
        videoPlayerController: _videoPlayerController,
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
