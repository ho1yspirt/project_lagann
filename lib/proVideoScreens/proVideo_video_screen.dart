import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:uni_links/uni_links.dart';
import 'package:video_player/video_player.dart';
import '../widgets/widgets.dart';

import '../models/video.dart';

class VideoScreen extends StatefulWidget {
  final VideoModel videoModel;
  const VideoScreen({Key? key, required this.videoModel}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool? isPlay;

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  void enterFullScr() {
    _chewieController!.enterFullScreen();
  }

  void exitFullScr() {
    _chewieController!.exitFullScreen();
  }

  void initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.videoModel.videoUrl);
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
        exitFullScr,
        videoPlayerController: _videoPlayerController,
        widget.videoModel,
        isPlay = _videoPlayerController.value.isPlaying,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayerController.value.isInitialized) {
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.immersive,
        );
      } else {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? const Color.fromARGB(0, 0, 0, 0)
              : kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayerItem(_videoPlayerController, _chewieController!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Expanded(
              flex: MediaQuery.of(context).orientation == Orientation.landscape
                  ? 0
                  : 5,
              child: MediaQuery.of(context).orientation == Orientation.landscape
                  ? const SizedBox()
                  : CustomScrollView(slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: UnderVideoWidgets(widget.videoModel),
                            ),
                            Expanded(
                              flex: 2,
                              child: SingleChildScrollView(
                                child: VideoCard(videoModel: widget.videoModel),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
            )
          ],
        ),
      ),
    );
  }
}
