import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/widgets/video_player_item.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/video.dart';

class VideoScreen extends StatefulWidget {
  final VideoModel videoModel;
  const VideoScreen({Key? key, required this.videoModel}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> hashTags = [
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const VideoPlayerItem(),
            // GestureDetector(
            //   onTap: () {
            //     PIPView.of(context)
            //         ?.presentBelow(const ProVideoHomeScreen());
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.only(left: 10, top: 10),
            //     child: Icon(
            //       Ionicons.chevron_down,
            //       size: 24,
            //       color: kWhiteColor,
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            widget.videoModel.title,
                            style: kVideoTitleTS,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Ionicons.chevron_down))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            "${widget.videoModel.viewCount} views",
                            style: kVideoInfoTS,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Container(
                          height: 5,
                          alignment: Alignment.bottomCenter,
                          child: kSeporatorDot),
                      Text(
                        timeago.format(widget.videoModel.timestamp),
                        style: kVideoInfoTS,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    height: 20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hashTags.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Text(hashTags[index]),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
