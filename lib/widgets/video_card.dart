import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../generated/l10n.dart';

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
          return FractionallySizedBox(
            heightFactor: 0.4,
            child: Column(children: [
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 18,
                    ),
                    child: Icon(
                      Ionicons.arrow_redo_outline,
                      color: Color(0xFFF2F2F2),
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      S.of(context).settings_message_share,
                      style: kChapterDefaultTS,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 18,
                    ),
                    child: Icon(
                      Ionicons.trash_outline,
                      color: Color(0xFFF2F2F2),
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      S.of(context).settings_message_share,
                      style: kChapterDefaultTS,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 18,
                    ),
                    child: Icon(
                      Ionicons.ban,
                      color: Color(0xFFF2F2F2),
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      S.of(context).settings_message_share,
                      style: kChapterDefaultTS,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 18,
                    ),
                    child: Icon(
                      Ionicons.flag_outline,
                      color: Color(0xFFF2F2F2),
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      S.of(context).settings_message_share,
                      style: kChapterDefaultTS,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 18,
                    ),
                    child: Icon(
                      Ionicons.bookmark_outline,
                      color: Color(0xFFF2F2F2),
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      S.of(context).settings_message_share,
                      style: kChapterDefaultTS,
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
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
                        "${widget.videoModel.author.username} • ${widget.videoModel.viewCount} • ${timeago.format(widget.videoModel.timestamp)}",
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
