import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:video_player/video_player.dart';

import '../utils/constants.dart';

class CustomConstrols extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;
  final Function enterFullScreen;
  const CustomConstrols(this.enterFullScreen,
      {Key? key, this.videoPlayerController})
      : super(key: key);

  @override
  State<CustomConstrols> createState() => _CustomConstrolsState();
}

class _CustomConstrolsState extends State<CustomConstrols>
    with TickerProviderStateMixin {
  bool _isPlay = true;
  bool _isVisibleRight = true;
  bool _isVisibleLeft = true;
  final Duration _skipDuration = const Duration(milliseconds: 400);

  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  String formatTime(Duration value) {
    DateFormat dateFormat = DateFormat('HH:mm:ss');
    var currentDateFormat = dateFormat.parse(value.toString());
    var currentTimeFormat = dateFormat.format(currentDateFormat);
    String? elementString;
    var split = currentTimeFormat.toString().split(":");
    if (int.parse(split[0]) < 1) {
      split.removeAt(0);
      elementString = "${split[0]}:${split[1]}";
    } else {
      elementString = "${split[0]}:${split[2]}:${split[2]}";
    }

    return elementString;
  }

  void onTapPause() {
    if (_isPlay == false) {
      _animationController.forward();
      _isPlay = true;
    } else {
      _animationController.reverse();
      _isPlay = false;
    }
    _isPlay
        ? widget.videoPlayerController!.pause()
        : widget.videoPlayerController!.play();
  }

  Future<void> forward10Seconds() async {
    goToPossition(
        (currentPosition) => currentPosition + const Duration(seconds: 10));
    setState(() {
      _isVisibleRight = false;
    });
    await Future.delayed(_skipDuration);
    setState(() {
      _isVisibleRight = true;
    });
  }

  Future<void> rewind10Seconds() async {
    goToPossition(
        (currentPosition) => currentPosition - const Duration(seconds: 10));
    setState(() {
      _isVisibleLeft = false;
    });
    await Future.delayed(_skipDuration);
    setState(() {
      _isVisibleLeft = true;
    });
  }

  Future<void> goToPossition(
      Duration Function(Duration currentPosition) builder) async {
    final currentPosition = await widget.videoPlayerController!.position;
    final newPosition = builder(currentPosition!);

    await widget.videoPlayerController!.seekTo(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
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
                    onDoubleTap: () {
                      rewind10Seconds();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: _isVisibleLeft
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Ionicons.play_skip_back,
                            size: 34,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Icon(
                                    Ionicons.play_back,
                                    size: 34,
                                  ),
                                ),
                                Text(
                                  "10 sec",
                                  style: kTenSecondsTS,
                                ),
                              ]),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () => onTapPause(),
                    child: AnimatedIcon(
                      icon: AnimatedIcons.pause_play,
                      progress: _animationController,
                      size: 50,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: _isVisibleRight
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Ionicons.play_skip_forward,
                            size: 34,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Icon(
                                    Ionicons.play_forward,
                                    size: 34,
                                  ),
                                ),
                                Text(
                                  "10 sec",
                                  style: kTenSecondsTS,
                                ),
                              ]),
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
            Positioned(
              left: 10,
              bottom: 20,
              child: ValueListenableBuilder(
                valueListenable: widget.videoPlayerController!,
                builder: (context, VideoPlayerValue value, child) {
                  var currentTimeFormat = formatTime(value.position);
                  var totalTimeFormat = formatTime(value.duration);
                  return Text("$currentTimeFormat / $totalTimeFormat");
                },
              ),
            ),
            Positioned(
              right: 10,
              bottom: 25,
              child: GestureDetector(
                onTap: () {
                  widget.enterFullScreen();
                },
                child: const Icon(
                  Ionicons.expand,
                  size: 16,
                ),
              ),
            ),
            VideoProgressIndicator(
              widget.videoPlayerController!,
              allowScrubbing: true,
              padding: const EdgeInsets.symmetric(vertical: 13),
              colors: VideoProgressColors(
                backgroundColor: const Color(0xFFF2F2F2).withOpacity(0.8),
                bufferedColor: kChapterActiveColor,
                playedColor: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
