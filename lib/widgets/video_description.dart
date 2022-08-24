import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';
import '../models/video.dart';
import '../utils/constants.dart';

class Description extends StatefulWidget {
  final VideoModel videoModel;
  final List<String> hashTags;
  final ScrollController scrollController;
  const Description(this.videoModel, this.hashTags, this.scrollController,
      {Key? key})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 7, top: 60),
        child: ListView(
          controller: widget.scrollController,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    widget.videoModel.title,
                    style: kVideoTitleTS,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CircleAvatar(
                  foregroundImage:
                      NetworkImage(widget.videoModel.author.profileImageUrl),
                  radius: 22,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.videoModel.author.username,
                  style: kVideoInfoTS.copyWith(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                //Likes
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text(
                        widget.videoModel.likes,
                        style: kSliverAppBarTS,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        S.of(context).description_like,
                        style: kVideoInfoTS,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                //Dislikes
                Column(
                  children: [
                    Text(
                      widget.videoModel.dislikes,
                      style: kSliverAppBarTS,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      S.of(context).description_dislike,
                      style: kVideoInfoTS,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                //Views
                Column(
                  children: [
                    Text(
                      widget.videoModel.viewCount,
                      style: kSliverAppBarTS,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      S.of(context).description_view,
                      style: kVideoInfoTS,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                //Date
                Column(
                  children: [
                    Text(
                      DateFormat("MMM dd").format(widget.videoModel.timestamp),
                      style: kSliverAppBarTS,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.videoModel.timestamp.year.toString(),
                      style: kVideoInfoTS,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: kSurfaceColor,
              height: 1,
            ),
            const SizedBox(
              height: 26,
            ),
            SizedBox(
              height: 60,
              child: GridView.builder(
                itemCount:
                    widget.hashTags.length < 9 ? widget.hashTags.length : 9,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 125,
                  childAspectRatio: 6,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return Text(widget.hashTags[index]);
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.videoModel.description,
              style: kVideoInfoTS.copyWith(
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
