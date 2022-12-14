import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/controllers/feedback_controller.dart';
import 'package:project_lagann/models/video.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class VideoFeedback extends StatefulWidget {
  final VideoModel videoModel;
  final Function? exitFullScreen;
  const VideoFeedback(this.videoModel, {Key? key, this.exitFullScreen})
      : super(key: key);

  @override
  State<VideoFeedback> createState() => _VideoFeedbackState();
}

class _VideoFeedbackState extends State<VideoFeedback> {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Row(
      mainAxisAlignment:
          isLandscape ? MainAxisAlignment.start : MainAxisAlignment.spaceAround,
      children: [
        //Like
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => context.read<FeedbakcController>().setLike(),
              icon: context.watch<FeedbakcController>().isLiked
                  ? const Icon(
                      Ionicons.heart,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Ionicons.heart_outline,
                    ),
            ),
            isLandscape
                ? const SizedBox()
                : Text(
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
              onPressed: () => context.read<FeedbakcController>().setDisLike(),
              icon: context.watch<FeedbakcController>().isDisLiked
                  ? const Icon(
                      Ionicons.heart_dislike,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Ionicons.heart_dislike_outline,
                    ),
            ),
            isLandscape
                ? const SizedBox()
                : Text(
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
            isLandscape
                ? const SizedBox()
                : Text(
                    S.of(context).action_share,
                    style: kTenSecondsTS,
                  ),
          ],
        ),
        if (isLandscape) const Spacer(),
        // Save
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => context.read<FeedbakcController>().setSaved(),
              icon: context.watch<FeedbakcController>().isSaved
                  ? const Icon(
                      Ionicons.bookmark,
                      color: kPrimaryColor,
                    )
                  : const Icon(
                      Ionicons.bookmark_outline,
                    ),
            ),
            isLandscape
                ? const SizedBox()
                : Text(
                    S.of(context).action_save,
                    style: kTenSecondsTS,
                  ),
          ],
        ),
        if (isLandscape)
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: InkWell(
              onTap: () {
                AutoOrientation.portraitAutoMode();
                widget.exitFullScreen!();
                Wakelock.enable();
              },
              child: const Icon(
                Ionicons.expand,
                size: kIconSize7,
              ),
            ),
          ),

        if (!isLandscape)
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
