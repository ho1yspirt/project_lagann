import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/widgets/reply_comment_item.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:project_lagann/models/comment.dart';

import '../utils/constants.dart';

class CommentItem extends StatefulWidget {
  final CommentModel commentModel;
  final List<CommentModel> replyList;
  final ScrollController scrollController;
  final int index;
  const CommentItem(
      this.commentModel, this.replyList, this.scrollController, this.index,
      {Key? key})
      : super(key: key);

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool _show = false;
  bool _isLike = false;
  int _currentOffset = 0;
  late int _countRepl;

  @override
  void initState() {
    super.initState();
    _countRepl = int.parse(widget.commentModel.repliesCount!);
  }

  void setOffsetReplyes() {
    int currentCount = int.parse(widget.commentModel.repliesCount!);
    if (currentCount >= _currentOffset + 4) {
      setState(() {
        _currentOffset += 4;
        _countRepl -= 4;
      });
    } else {
      setState(() {
        _countRepl -= _countRepl;
        _currentOffset = currentCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 7,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
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
                      foregroundImage: NetworkImage(
                        widget.commentModel.author.profileImageUrl,
                      ),
                      radius: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 5),
                      child: Row(
                        children: [
                          Text(
                            widget.commentModel.author.username,
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
                            timeago.format(widget.commentModel.timestamp),
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
                              setState(() {
                                _isLike = !_isLike;
                              });
                            },
                            child: _isLike
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
                            widget.commentModel.likes,
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
                  widget.commentModel.description,
                  style: kVideoInfoTS.copyWith(color: kWhiteColor),
                ),
              ),
            ],
          ),
          if (_show)
            Padding(
              padding: const EdgeInsets.only(left: 49),
              child: ListView.builder(
                // controller: widget.scrollController,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _currentOffset,
                itemBuilder: (context, index) {
                  var reply = widget.replyList[index];
                  return ReplyCommentItem(reply);
                },
              ),
            )
          else
            const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    if (_countRepl == 0) return;
                    setState(() {
                      _show = true;
                    });
                    setOffsetReplyes();
                  },
                  child: Text(
                    "Reply ($_countRepl)",
                    style: kSubtitle2.copyWith(color: kPrimaryColor),
                  ),
                ),
                const Spacer(),
                _show
                    ? Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _show = false;
                              widget.scrollController.animateTo(
                                double.parse(widget.commentModel.id) * 80,
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                              _currentOffset = 0;
                              _countRepl =
                                  int.parse(widget.commentModel.repliesCount!);
                            });
                          },
                          child: Text(
                            "Hide",
                            style: kSubtitle2.copyWith(color: kPrimaryColor),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
