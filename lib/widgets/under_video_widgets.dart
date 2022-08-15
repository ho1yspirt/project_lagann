import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/widgets/video_feedback_items.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/constants.dart';

class UnderVideoWidgets extends StatefulWidget {
  final VideoModel videoModel;
  const UnderVideoWidgets(this.videoModel, {Key? key}) : super(key: key);

  @override
  State<UnderVideoWidgets> createState() => _UnderVideoWidgetsState();
}

class _UnderVideoWidgetsState extends State<UnderVideoWidgets> {
  List<String> hashTags = [
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: const Icon(Ionicons.chevron_down))
            ],
          ),
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
              child: kSeporatorDot,
            ),
            Text(
              timeago.format(widget.videoModel.timestamp),
              style: kVideoInfoTS,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        SizedBox(
          height: 47,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: GridView.builder(
                itemCount: hashTags.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.9,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 15,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Text(hashTags[index]);
                }),
          ),
        ),
        VideoFeedback(widget.videoModel),
        SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 95,
                  top: 12,
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kSurfaceColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 8,
                  top: 8,
                  bottom: 16,
                ),
                child: CircleAvatar(
                  foregroundImage:
                      NetworkImage(widget.videoModel.author.profileImageUrl),
                  radius: 30,
                ),
              ),
              Positioned(
                left: 85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.videoModel.author.username,
                      style: kVideoInfoTS.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.videoModel.author.subscribers,
                      style: kVideoInfoTS.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "SUBSCRIBE",
                    style: kVideoInfoTS.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kSurfaceColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Comments",
                style: kChapterDefaultTS,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                widget.videoModel.commentsCount,
                style: kChapterDefaultTS,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 187,
              ),
              const Icon(Ionicons.swap_vertical)
            ],
          ),
        )
      ],
    );
  }
}
