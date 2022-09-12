import 'package:flutter/material.dart';
import '../../models/comment.dart';
import '../../utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationCommentItem extends StatelessWidget {
  final CommentModel commentModel;
  const NotificationCommentItem({Key? key, required this.commentModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 32),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage:
                      NetworkImage(commentModel.author.profileImageUrl),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          commentModel.author.username,
                          style: kSubtitle2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 1),
                            Text(
                              commentModel.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kBody2TS.copyWith(color: kWhiteColor),
                            ),
                            const SizedBox(height: 1),
                            Row(
                              children: [
                                Text(commentModel.commentType,
                                    style:
                                        kBody2TS.copyWith(color: kGreyColor)),
                                kSeporatorDot,
                                Flexible(
                                  child: Text(
                                      timeago.format(
                                        commentModel.timestamp,
                                        allowFromNow: true,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          kBody2TS.copyWith(color: kGreyColor)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.network(
                        commentModel.video.thumbnailUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
