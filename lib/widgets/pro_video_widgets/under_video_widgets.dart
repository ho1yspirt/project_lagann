import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/controllers/comments_controller.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/widgets/pro_video_widgets/video_description.dart';
import 'package:project_lagann/widgets/pro_video_widgets/video_feedback_items.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../generated/l10n.dart';
import '../../utils/constants.dart';

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
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
    '#DrawExpress',
  ];

  void onTapShowDescription() {
    showFlexibleBottomSheet(
      context: context,
      isModal: true,
      // barrierColor: Colors.black12,
      minHeight: 0.692,
      initHeight: 0.692,
      maxHeight: 0.692,
      anchors: [0, 0.685],
      bottomSheetColor: kBackgroundColor,
      builder: (
        BuildContext context,
        ScrollController scrollController,
        _,
      ) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).description_title,
                      style: kSliverAppBarTS,
                    ),
                    IconButton(
                      onPressed: () {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight
                        ]);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Ionicons.close,
                        size: kIconSize7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: Description(
                widget.videoModel,
                hashTags,
                scrollController,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  onPressed: () {
                    onTapShowDescription();
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown
                    ]);
                  },
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
          height: 27,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(hashTags[index]));
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
                  // right: 8,
                  top: 8,
                  bottom: 16,
                ),
                child: CircleAvatar(
                  foregroundImage:
                      NetworkImage(widget.videoModel.author.profileImageUrl),
                  radius: 22,
                ),
              ),
              Positioned(
                left: 70,
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
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context
                .read<CommentsController>()
                .onTapCommets(context, widget.videoModel),
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
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    Ionicons.swap_vertical,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
