import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem(this.videoPlayerController, this.chewieController,
      {Key? key})
      : super(key: key);

  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: widget.videoPlayerController.value.isInitialized
          ? Chewie(controller: widget.chewieController)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
