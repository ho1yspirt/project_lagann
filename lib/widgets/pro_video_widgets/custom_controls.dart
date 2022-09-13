import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phone_state/phone_state.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/widgets/pro_video_widgets/video_progress_indicator.dart';
import 'package:project_lagann/widgets/pro_video_widgets/video_settings.dart';
import 'package:project_lagann/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../utils/constants.dart';

// ignore: must_be_immutable
class CustomConstrols extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;
  final Function enterFullScreen;
  final Function exitFullScreen;
  final VideoModel videoModel;
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

  final Duration _skipDuration = const Duration(milliseconds: 400);
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward(from: 0.3);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    animationController.dispose();
    Wakelock.disable();

    super.dispose();
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
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      bottom: false,
      top: false,
      child: StreamBuilder<PhoneStateStatus?>(
          initialData: PhoneStateStatus.NOTHING,
          stream: PhoneState.phoneStateStream,
          builder: (context, AsyncSnapshot<PhoneStateStatus?> status) {
            if (status.data!.index == 3) {
              onTapPause();
            } else if (status.data!.index == 1) {
              onTapPause();
            }
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedOpacity(
                  opacity: _isVisibleAll ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: GestureDetector(
                          onTap: () => setVisible(),
                        ),
                      ),
                      if (isLandscape)
                        Container(
                          margin: const EdgeInsets.only(left: 64, top: 12),
                          width: 430,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      widget.exitFullScreen();
                                      AutoOrientation.portraitAutoMode();
                                    },
                                    icon: const Icon(Ionicons.chevron_down),
                                  ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 344,
                                      minWidth: 50,
                                    ),
                                    child: Text(
                                      widget.videoModel.title,
                                      style: kVideoTitleTS,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Icon(Ionicons.chevron_forward)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 48),
                                child: Text(
                                  widget.videoModel.author.username,
                                  style:
                                      kSubtitle2.copyWith(color: kWhiteColor),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                        right: isLandscape ? 30 : 8.5,
                        child: IconButton(
                          onPressed: () => onTapSettingsInFullScreen(context),
                          icon: const Icon(Ionicons.settings_outline),
                        ),
                      ),
                      if (!isLandscape)
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: ValueListenableBuilder(
                            valueListenable: widget.videoPlayerController!,
                            builder: (context, VideoPlayerValue value, child) {
                              var currentTimeFormat =
                                  formatTime(value.position);
                              var totalTimeFormat = formatTime(value.duration);
                              return Text(
                                  "$currentTimeFormat / $totalTimeFormat");
                            },
                          ),
                        ),
                      if (!isLandscape)
                        Positioned(
                          top: 5,
                          left: 8.5,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Ionicons.chevron_down),
                          ),
                        ),
                      if (!isLandscape)
                        Positioned(
                          right: 12.5,
                          bottom: 14,
                          child: InkWell(
                            onTap: () {
                              // AutoOrientation.landscapeAutoMode();
                              widget.enterFullScreen();
                              Wakelock.enable();
                            },
                            child: const Icon(
                              Ionicons.expand,
                              size: kIconSize8,
                            ),
                          ),
                        ),
                      if (isLandscape)
                        Container(
                          height: 80,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60, right: 36),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable:
                                      widget.videoPlayerController!,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    var currentTimeFormat =
                                        formatTime(value.position);
                                    var totalTimeFormat =
                                        formatTime(value.duration);
                                    return Text(
                                      "$currentTimeFormat / $totalTimeFormat",
                                    );
                                  },
                                ),
                                VideoProgressBar(
                                  widget.videoPlayerController!,
                                  barHeight: 5,
                                  handleHeight: 6,
                                  drawShadow: true,
                                  colors: ChewieProgressColors(
                                    playedColor: kPrimaryColor,
                                    bufferedColor: kWhiteColor,
                                    backgroundColor: const Color(0xFFF2F2F2)
                                        .withOpacity(0.8),
                                    handleColor: kPrimaryColor,
                                  ),
                                ),
                                VideoFeedback(
                                  widget.videoModel,
                                  exitFullScreen: widget.exitFullScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (!isLandscape)
                  Positioned(
                    height: 10,
                    child: VideoProgressBar(
                      widget.videoPlayerController!,
                      barHeight: 5,
                      handleHeight: 6,
                      drawShadow: true,
                      colors: ChewieProgressColors(
                        playedColor: kPrimaryColor,
                        bufferedColor: kWhiteColor,
                        backgroundColor:
                            const Color(0xFFF2F2F2).withOpacity(0.8),
                        handleColor: kPrimaryColor,
                      ),
                    ),
                  ),
              ],
            );
          }),
    );
  }
}
