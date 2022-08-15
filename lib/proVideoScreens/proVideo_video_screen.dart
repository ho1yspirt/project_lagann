import 'package:flutter/material.dart';
import 'package:project_lagann/widgets/under_video_widgets.dart';
import 'package:project_lagann/widgets/video_card.dart';
import 'package:project_lagann/widgets/video_player_item.dart';

import '../models/video.dart';

class VideoScreen extends StatefulWidget {
  final VideoModel videoModel;
  const VideoScreen({Key? key, required this.videoModel}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: VideoPlayerItem(),
            ),
            Expanded(
              flex: 5,
              child: CustomScrollView(slivers: [
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
