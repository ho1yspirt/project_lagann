import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';
import '../widgets/widgets.dart';

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
      backgroundColor:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? const Color.fromARGB(0, 0, 0, 0)
              : kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: VideoPlayerItem(),
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
