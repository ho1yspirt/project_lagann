import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/video.dart';

import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class VideoFeedback extends StatefulWidget {
  final VideoModel videoModel;
  const VideoFeedback(this.videoModel, {Key? key}) : super(key: key);

  @override
  State<VideoFeedback> createState() => _VideoFeedbackState();
}

class _VideoFeedbackState extends State<VideoFeedback> {
  bool _isLiked = false;
  bool _isDisLiked = false;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Like
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (_isDisLiked) {
                  setState(() {
                    _isLiked = !_isLiked;
                    _isDisLiked = false;
                  });
                } else {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                }
              },
              icon: _isLiked
                  ? const Icon(
                      Ionicons.heart,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Ionicons.heart_outline,
                    ),
            ),
            Text(
              widget.videoModel.likes,
              style: kTenSecondsTS,
            ),
          ],
        ),
        //DissLike
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (_isLiked) {
                  setState(() {
                    _isDisLiked = true;
                    _isLiked = false;
                  });
                } else {
                  setState(() {
                    _isDisLiked = !_isDisLiked;
                  });
                }
              },
              icon: _isDisLiked
                  ? const Icon(
                      Ionicons.heart_dislike,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Ionicons.heart_dislike_outline,
                    ),
            ),
            Text(
              widget.videoModel.dislikes,
              style: kTenSecondsTS,
            ),
          ],
        ),
        // Share
        Column(
          children: [
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: const Icon(
                  Ionicons.share_outline,
                )),
            Text(
              S.of(context).action_share,
              style: kTenSecondsTS,
            ),
          ],
        ),
        // Save
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  _isSaved = !_isSaved;
                });
              },
              icon: _isSaved
                  ? const Icon(
                      Ionicons.bookmark,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Ionicons.bookmark_outline,
                    ),
            ),
            Text(
              S.of(context).action_save,
              style: kTenSecondsTS,
            ),
          ],
        ),
        // Report
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(
                Ionicons.flag_outline,
              ),
            ),
            Text(
              S.of(context).action_report,
              style: kTenSecondsTS,
            ),
          ],
        ),
      ],
    );
  }
}
