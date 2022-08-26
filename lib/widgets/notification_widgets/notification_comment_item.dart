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
    return InkWell(
      onTap: (() {}),
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 6, left: 16, right: 16),
        leading: CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(commentModel.author.profileImageUrl),
        ),
        title: Text(
          commentModel.author.username,
          style: kSubtitle2,
        ),
        subtitle: Column(
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
                    style: kBody2TS.copyWith(color: kGreyColor)),
                kSeporatorDot,
                Flexible(
                  child: Text(
                      timeago.format(
                        commentModel.timestamp,
                        allowFromNow: true,
                      ),
                      overflow: TextOverflow.ellipsis,
                      style: kBody2TS.copyWith(color: kGreyColor)),
                ),
              ],
            ),
          ],
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              commentModel.video.thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
