import 'package:flutter/material.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/proVideoScreens/proVideo_video_screen.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../widgets/widgets.dart';

class VideoCard extends StatefulWidget {
  final VideoModel videoModel;
  const VideoCard({Key? key, required this.videoModel}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  void onPressThreeDots() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: kBackgroundColor,
        builder: (BuildContext context) {
          return const SettingElements();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VideoScreen(
                  videoModel: widget.videoModel,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.videoModel.thumbnailUrl,
                height: 206,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 6,
                right: 8,
                top: 8,
                bottom: 16,
              ),
              child: CircleAvatar(
                foregroundImage:
                    NetworkImage(widget.videoModel.author.profileImageUrl),
                radius: 25,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: Text(
                        widget.videoModel.title,
                        style: kVideoTitleTS,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        "${widget.videoModel.author.username} • ${widget.videoModel.viewCount} • ${timeago.format(
                          widget.videoModel.timestamp,
                          allowFromNow: true,
                        )}",
                        style: kVideoInfoTS,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                onPressThreeDots();
              },
              icon: const Icon(
                Icons.more_vert,
                size: 26,
              ),
            ),
          ],
        )
      ],
    );
  }
}
