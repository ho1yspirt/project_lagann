import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_lagann/widgets/courses_widgets/course_lesson_card.dart';
import 'package:project_lagann/widgets/courses_widgets/course_lessons_list.dart';
import 'package:video_player/video_player.dart';
import '../../generated/l10n.dart';
import '../../models/video.dart';
import '../../utils/constants.dart';
import '../../widgets/widgets.dart';

class CourseVideoSCreen extends StatefulWidget {
  final VideoModel videoModel;
  final bool isPurchased;
  const CourseVideoSCreen(
      {Key? key, required this.videoModel, required this.isPurchased})
      : super(key: key);

  @override
  State<CourseVideoSCreen> createState() => _CourseVideoSCreenState();
}

class _CourseVideoSCreenState extends State<CourseVideoSCreen> {
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
            SizedBox(
              height: 230,
              width: MediaQuery.of(context).size.width,
              child: _videoPlayerController.value.isInitialized
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: VideoPlayerItem(
                        _videoPlayerController,
                        _chewieController!,
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Expanded(
              flex: MediaQuery.of(context).orientation == Orientation.landscape
                  ? 0
                  : 5,
              child: MediaQuery.of(context).orientation == Orientation.landscape
                  ? const SizedBox.shrink()
                  : CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverToBoxAdapter(
                          child: UnderVideoWidgets(widget.videoModel),
                        ),
                        CourseLessonsList(isPurchased: widget.isPurchased),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 16),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
