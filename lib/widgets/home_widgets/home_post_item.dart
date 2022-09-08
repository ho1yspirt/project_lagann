import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/theme.dart';
import 'package:video_player/video_player.dart';
import '../../generated/l10n.dart';
import '../../utils/constants.dart';
import 'custom_home_button.dart';

class HomePostItem extends StatefulWidget {
  final bool isMarathon;
  const HomePostItem(this.isMarathon, {Key? key}) : super(key: key);

  @override
  State<HomePostItem> createState() => _HomePostItemState();
}

class _HomePostItemState extends State<HomePostItem> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

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
  }

  void enterFullScr() {
    _chewieController!.enterFullScreen();
  }

  void exitFullScr() {
    _chewieController!.exitFullScreen();
  }

  void initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      autoInitialize: true,
      allowedScreenSleep: false,
      allowFullScreen: false,
      allowMuting: false,
      showControls: true,
      aspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height,
      // customControls: CustomConstrols(
      //   enterFullScr,
      //   exitFullScr,
      //   videoPlayerController: _videoPlayerController,
      //   widget.videoModel,
      //   isPlay = _videoPlayerController.value.isPlaying,
      // ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const SizedBox(),
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                                'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '@Andrew Pech',
                                style: kSubtitle2,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Text(
                                    '700k views',
                                    style: kCaptionsTS,
                                  ),
                                  kSeporatorDot,
                                  const Text(
                                    '2 week ago',
                                    style: kCaptionsTS,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '#hashtags #hashtags #hashtags',
                              style: kSubtitle2,
                            ),
                            SizedBox(height: 4),
                            Text(
                                style: kBody2TS,
                                'captions captions captions captions captions captions captions captions captions'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              if (widget.isMarathon)
                                const CustomHomeButton(
                                  isChangeble: true,
                                  icon: Icon(Ionicons.star_outline),
                                  activatedIcon: GradientIcon(
                                    icon: Ionicons.star,
                                    size: kIconSize5,
                                    gradient: kPrimaryGradient,
                                  ),
                                ),
                              const CustomHomeButton(
                                  isChangeble: true,
                                  icon: Icon(Ionicons.heart_outline),
                                  activatedIcon: GradientIcon(
                                      icon: Ionicons.heart,
                                      size: kIconSize5,
                                      gradient: kPrimaryGradient),
                                  title: '500k'),
                              const CustomHomeButton(
                                  isChangeble: false,
                                  icon: Icon(Ionicons.chatbubble_outline),
                                  activatedIcon: GradientIcon(
                                      icon: Ionicons.chatbubble,
                                      size: kIconSize5,
                                      gradient: kPrimaryGradient),
                                  title: '12k'),
                              CustomHomeButton(
                                  isChangeble: true,
                                  icon: const Icon(Ionicons.bookmark_outline),
                                  activatedIcon: const GradientIcon(
                                      icon: Ionicons.bookmark,
                                      size: kIconSize5,
                                      gradient: kPrimaryGradient),
                                  title: S.of(context).action_save),
                              CustomHomeButton(
                                  isChangeble: false,
                                  icon: const Icon(Ionicons.share_outline),
                                  activatedIcon: const GradientIcon(
                                      icon: Ionicons.share,
                                      size: kIconSize5,
                                      gradient: kPrimaryGradient),
                                  title: S.of(context).action_share),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 380,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
