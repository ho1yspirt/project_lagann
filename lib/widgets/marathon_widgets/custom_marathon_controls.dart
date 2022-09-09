import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/controllers/short_video_controller.dart';
import 'package:project_lagann/screens/notification_screens/notifications_screen.dart';
import 'package:project_lagann/utils/theme.dart';
import 'package:project_lagann/widgets/marathon_widgets/like_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../screens/search_screens/search_screen.dart';
import '../../utils/constants.dart';
import '../pro_video_widgets/video_progress_indicator.dart';

class CustomMarathonControls extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final Function? pop;
  const CustomMarathonControls(this.videoPlayerController, {Key? key, this.pop})
      : super(key: key);

  @override
  State<CustomMarathonControls> createState() => _CustomMarathonControlsState();
}

class _CustomMarathonControlsState extends State<CustomMarathonControls>
    with TickerProviderStateMixin {
  bool _isPause = false;
  bool _isVisibleRight = true;
  bool _isVisibleLeft = true;
  bool _isHeartAnimating = false;
  final Duration _skipDuration = const Duration(milliseconds: 400);

  late AnimationController animationController;
  late Animation<double> animation;

  void onTapPause() {
    setState(() {
      _isPause = !_isPause;
    });
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward(from: 0.3);
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCirc);
    _isPause
        ? widget.videoPlayerController.pause()
        : widget.videoPlayerController.play();
  }

  Future<void> goToPossition(
      Duration Function(Duration currentPosition) builder) async {
    final currentPosition = await widget.videoPlayerController.position;
    final newPosition = builder(currentPosition!);

    await widget.videoPlayerController.seekTo(newPosition);
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
    super.dispose();
    animationController.dispose();
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      color: _isPause || context.watch<ShortVideoController>().isTimeBarVisible
          ? Colors.black54
          : Colors.transparent,
      child: Stack(
        children: [
          //AppBar
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () => widget.pop!(),
                  child: const Icon(Ionicons.arrow_back),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  ),
                  child: const Icon(Ionicons.search),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  ),
                  child: const Icon(Ionicons.notifications),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 305,
                  height: MediaQuery.of(context).size.height - 100,
                  child: GestureDetector(
                    onTap: () {
                      onTapPause();
                    },
                    onDoubleTap: () {
                      context.read<ShortVideoController>().setLike();
                      setState(() {
                        _isHeartAnimating = true;
                      });
                    },
                    onLongPress: () => setState(() {
                      context
                          .read<ShortVideoController>()
                          .setTimeBarVisible(true);
                    }),
                    onLongPressEnd: (_) => setState(() {
                      context
                          .read<ShortVideoController>()
                          .setTimeBarVisible(false);
                    }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      height: MediaQuery.of(context).size.height,
                      child: GestureDetector(
                        onDoubleTap: () => rewind10Seconds(),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: MediaQuery.of(context).size.height,
                      child: GestureDetector(
                        onDoubleTap: () => forward10Seconds(),
                      ),
                    ),
                  ],
                ),
                Opacity(
                  opacity: _isHeartAnimating ? 1 : 0,
                  child: LikeAnimationWidget(
                    isAnimated: _isHeartAnimating,
                    onEnd: () => setState(() {
                      _isHeartAnimating = false;
                    }),
                    duration: const Duration(milliseconds: 600),
                    child: const GradientIcon(
                      icon: Ionicons.heart,
                      size: kIconSize2,
                      gradient: kPrimaryGradient,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: _isVisibleLeft
                            ? const SizedBox(
                                width: 58,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15),
                                        child: Icon(
                                          Ionicons.play_back,
                                          size: kIconSize3,
                                        ),
                                      ),
                                      Text(
                                        "10 sec",
                                        style: kHeadline5.copyWith(
                                          color: kWhiteColor,
                                          letterSpacing: 0.08,
                                        ),
                                      ),
                                    ]),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () => onTapPause(),
                          child: FadeTransition(
                            opacity: animation,
                            child: _isPause
                                ? const Icon(
                                    Ionicons.play,
                                    size: kIconSize2,
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: _isVisibleRight
                            ? const SizedBox(
                                width: 58,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Icon(
                                        Ionicons.play_forward,
                                        size: kIconSize3,
                                      ),
                                    ),
                                    Text(
                                      "10 sec",
                                      style: kHeadline5.copyWith(
                                        color: kWhiteColor,
                                        letterSpacing: 0.08,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                if (context.watch<ShortVideoController>().isTimeBarVisible)
                  Positioned(
                    bottom: 90,
                    left: 16,
                    right: 16,
                    child: Column(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: widget.videoPlayerController,
                          builder: (context, VideoPlayerValue value, child) {
                            var currentTimeFormat = formatTime(value.position);
                            var totalTimeFormat = formatTime(value.duration);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$currentTimeFormat / ",
                                  style:
                                      kHeadline4.copyWith(color: kWhiteColor),
                                ),
                                Text(
                                  totalTimeFormat,
                                  style: kHeadline4.copyWith(
                                    color: kWhiteColor.withOpacity(0.6),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        VideoProgressBar(
                          widget.videoPlayerController,
                          barHeight: 4,
                          handleHeight: 4,
                          drawShadow: true,
                          colors: ChewieProgressColors(
                            playedColor: kWhiteColor,
                            bufferedColor: kWhiteColor,
                            backgroundColor:
                                const Color(0xFFF2F2F2).withOpacity(0.8),
                            handleColor: kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
