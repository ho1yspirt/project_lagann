import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/proVideoScreens/proVideo_video_screen.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/widgets/pro_video_widgets/settings_elements.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../widgets/widgets.dart';

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
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
          return SettingElements(widget.videoModel.videoUrl);
        }).then((value) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.videoModel.thumbnailUrl,
                  height: 206,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      child: CircleAvatar(
                        foregroundImage: NetworkImage(
                            widget.videoModel.author.profileImageUrl),
                        radius: 22,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                width: 280,
                                child: Text(
                                  widget.videoModel.title,
                                  style: kVideoTitleTS,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                constraints:
                                    const BoxConstraints(maxHeight: 24),
                                iconSize: kIconSize8,
                                padding: const EdgeInsets.all(4),
                                onPressed: () {
                                  onPressThreeDots();
                                },
                                icon: const Icon(
                                  Ionicons.ellipsis_vertical_outline,
                                ),
                              ),
                            ],
                          ),
                          Flexible(
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
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
