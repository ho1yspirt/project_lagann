import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/comment.dart';
import '../utils/constants.dart';

class ReplyCommentItem extends StatefulWidget {
  final CommentModel reply;
  const ReplyCommentItem(this.reply, {Key? key}) : super(key: key);

  @override
  State<ReplyCommentItem> createState() => _ReplyCommentItemState();
}

class _ReplyCommentItemState extends State<ReplyCommentItem> {
  bool _isLikeReply = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundImage:
                        NetworkImage(widget.reply.author.profileImageUrl),
                    radius: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 5),
                    child: Row(
                      children: [
                        Text(
                          widget.reply.author.username,
                          style: kTenSecondsTS,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          height: 5,
                          alignment: Alignment.bottomCenter,
                          child: kSeporatorDot,
                        ),
                        Text(
                          timeago.format(widget.reply.timestamp),
                          style: kTenSecondsTS,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 14,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                            _isLikeReply = !_isLikeReply;
                          },
                          child: _isLikeReply
                              ? const Icon(
                                  Ionicons.heart,
                                  size: kIconSize7,
                                  color: kPrimaryColor,
                                )
                              : const Icon(
                                  Ionicons.heart_outline,
                                  size: kIconSize7,
                                ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          widget.reply.likes,
                          style: kTenSecondsTS,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 36,
                left: 49,
                right: 68,
              ),
              child: Text(
                widget.reply.description,
                style: kVideoInfoTS.copyWith(color: kWhiteColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
