import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

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
  bool _isVisibleAll = true;
  bool _isFullScreen = true;
  String currentSpeed = "1.0";

  List<DropdownMenuItem<String>> settingItems = [
    const DropdownMenuItem(value: "1.0", child: Text("Normal")),
    const DropdownMenuItem(value: "2.0", child: Text("2.0x")),
    const DropdownMenuItem(value: "1.75", child: Text("1.75x")),
    const DropdownMenuItem(value: "1.5", child: Text("1.5x")),
    const DropdownMenuItem(value: "1.25", child: Text("1.25x")),
    const DropdownMenuItem(value: "0.75", child: Text("0.75x")),
    const DropdownMenuItem(value: "0.5", child: Text("0.5x")),
    const DropdownMenuItem(value: "0.25", child: Text("0.25x")),
  ];

  final Duration _skipDuration = const Duration(milliseconds: 400);

  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    // setVisibleAfter();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() async {
    super.dispose();
    _animationController.dispose();
    await Wakelock.disable();
  }

  void onTapSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: kBackgroundColor,
        child: SizedBox(
          height: 120,
          width: 412,
          child: Stack(alignment: Alignment.topCenter, children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Icon(
                      Ionicons.timer_outline,
                      size: 30,
                    ),
                  ),
                  const Text(
                    "Video speed",
                    style: kVideoTitleTS,
                  ),
                  //const Padding(
                  //   padding: EdgeInsets.only(left: 50),
                  //   child: Text(
                  //     "Normal",
                  //     style: kVideoTitleTS,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: kBackgroundColor,
                        icon: const Icon(
                          Ionicons.chevron_down,
                          color: kWhiteColor,
                        ),
                        style: kVideoTitleTS,
                        items: settingItems,
                        value: currentSpeed,
                        onChanged: (String? newSpeed) {
                          widget.videoPlayerController!
                              .setPlaybackSpeed(double.parse(newSpeed!));
                          setState(() {
                            currentSpeed = newSpeed;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Icon(
                      Ionicons.help,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Help and feedback",
                    style: kVideoTitleTS,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
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
              Expanded(
                child: GestureDetector(
                  onTap: () => setVisible(),
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
                top: 5,
                right: 8.5,
                child: IconButton(
                  onPressed: () => onTapSettings(context),
                  icon: const Icon(Ionicons.settings_outline),
                ),
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
                bottom: 15,
                child: GestureDetector(
                  onTap: () async {
                    if (MediaQuery.of(context).orientation ==
                        Orientation.portrait) {
                      AutoOrientation.landscapeRightMode();
                      widget.enterFullScreen();
                    } else if (MediaQuery.of(context).orientation !=
                        Orientation.portrait) {
                      widget.enterFullScreen();
                      AutoOrientation.portraitUpMode();
                    }

                    await Wakelock.enable();
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
        VideoProgressIndicator(
          widget.videoPlayerController!,
          allowScrubbing: true,
          // padding: EdgeInsets.only(bottom: 14),
          colors: VideoProgressColors(
            backgroundColor: const Color(0xFFF2F2F2).withOpacity(0.8),
            bufferedColor: kChapterActiveColor,
            playedColor: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
