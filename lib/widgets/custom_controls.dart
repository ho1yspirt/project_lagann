import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/widgets/video_progress_indicator.dart';
import 'package:project_lagann/widgets/video_settings.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../utils/constants.dart';

class CustomConstrols extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;
  final Function enterFullScreen;
  final Function exitFullScreen;
  VideoModel videoModel;
  bool isPlay;
  CustomConstrols(
      this.enterFullScreen, this.exitFullScreen, this.videoModel, this.isPlay,
      {Key? key, this.videoPlayerController})
      : super(key: key);

  @override
  State<CustomConstrols> createState() => _CustomConstrolsState();
}

class _CustomConstrolsState extends State<CustomConstrols>
    with TickerProviderStateMixin {
  bool _isVisibleRight = true;
  bool _isVisibleLeft = true;
  bool _isVisibleAll = true;
  String currentSpeed = "1.0";

  List<DropdownMenuItem<String>> settingItems = [
    const DropdownMenuItem(value: "2.0", child: Text("2.0x")),
    const DropdownMenuItem(value: "1.75", child: Text("1.75x")),
    const DropdownMenuItem(value: "1.5", child: Text("1.5x")),
    const DropdownMenuItem(value: "1.25", child: Text("1.25x")),
    const DropdownMenuItem(value: "1.0", child: Text("Normal")),
    const DropdownMenuItem(value: "0.75", child: Text("0.75x")),
    const DropdownMenuItem(value: "0.5", child: Text("0.5x")),
    const DropdownMenuItem(value: "0.25", child: Text("0.25x")),
  ];


  final Duration _skipDuration = const Duration(milliseconds: 400);
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward(from: 1);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() async {
    super.dispose();
    animationController.dispose();
    await Wakelock.disable();
  }

  void onTapSettingsInPortraitMode() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: kBackgroundColor,
        builder: (BuildContext context) {
          return SizedBox(
            height: 134,
            child: VideoSettings(widget.videoPlayerController!),
          );
        });
  }

  void onTapSettingsInFullScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, StateSetter setState) {
        return Dialog(
          backgroundColor: kBackgroundColor,
          child: SizedBox(
            height: 120,
            width: 412,
            child: VideoSettings(widget.videoPlayerController!),
          ),
        );
      }),
    );
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
    setState(() {
      widget.isPlay = !widget.isPlay;
    });
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward(from: 0.3);
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCirc);
    widget.isPlay
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

  // void setVisibleAfter() async {
  //   if (_isVisibleAll && !_isDispose) {
  //     await Future.delayed(const Duration(seconds: 5));
  //     setState(() {
  //       _isVisibleAll = false;
  //     });
  //   }
  // }

  void setVisible() {
    setState(() {
      _isVisibleAll = !_isVisibleAll;
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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedOpacity(
          opacity: _isVisibleAll ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: GestureDetector(
                  onTap: () => setVisible(),
                ),
              ),
              if (MediaQuery.of(context).orientation == Orientation.landscape)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 50),
                      child: Row(
                        children: [
                          const Icon(Ionicons.chevron_down),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.videoModel.title,
                            style: kVideoTitleTS,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Ionicons.chevron_forward)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 95),
                      child: Text(
                        widget.videoModel.author.username,
                        style: kSubtitle2.copyWith(color: kWhiteColor),
                      ),
                    ),
                  ],
                )
              else
                const SizedBox(),
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
                      child: FadeTransition(
                        opacity: animation,
                        child: widget.isPlay
                            ? const Icon(
                                Ionicons.play,
                                size: 34,
                              )
                            : const Icon(
                                Ionicons.pause,
                                size: 34,
                              ),
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
                top: 5,
                right: 8.5,
                child: IconButton(
                  onPressed: () => MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? onTapSettingsInFullScreen(context)
                      : onTapSettingsInPortraitMode(),
                  icon: const Icon(Ionicons.settings_outline),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.chevron_down),
              ),
              Positioned(
                left: 10,
                bottom: 10,
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
                right: 12.5,
                bottom: 14,
                child: GestureDetector(
                  onTap: () {
                    if (MediaQuery.of(context).orientation ==
                        Orientation.portrait) {
                      // AutoOrientation.landscapeAutoMode();
                      widget.enterFullScreen();
                    } else if (MediaQuery.of(context).orientation ==
                        Orientation.landscape) {
                      AutoOrientation.portraitAutoMode();

                      widget.exitFullScreen();
                    }

                    Wakelock.enable();
                  },
                  child: const Icon(
                    Ionicons.expand,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          height: 5,
          child: VideoProgressBar(
            widget.videoPlayerController!,
            barHeight: 5,
            handleHeight: 6,
            drawShadow: true,
            colors: ChewieProgressColors(
              playedColor: kPrimaryColor,
              bufferedColor: kWhiteColor,
              backgroundColor: const Color(0xFFF2F2F2).withOpacity(0.8),
              handleColor: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
