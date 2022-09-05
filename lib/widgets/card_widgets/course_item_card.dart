import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';
import '../../generated/l10n.dart';
import '../../screens/courses_screens/course_item_screen.dart';

class CourseItemCard extends StatefulWidget {
  final bool isPurchased;
  const CourseItemCard({Key? key, required this.isPurchased}) : super(key: key);

  @override
  State<CourseItemCard> createState() => _CourseItemCardState();
}

class _CourseItemCardState extends State<CourseItemCard> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseItemScreen(
                isPurchased: widget.isPurchased,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 5 / 4,
                    child: Image.network(
                      'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3D Design',
                        style: kBody2TS.copyWith(color: kPrimaryColor),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isSaved = !_isSaved;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: _isSaved
                              ? const Icon(
                                  Ionicons.bookmark,
                                  size: kIconSize7,
                                  color: kPrimaryColor,
                                )
                              : const Icon(
                                  Ionicons.bookmark_outline,
                                  size: kIconSize7,
                                ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '3D way of the samurai, and basics of 3D',
                    style: kSubtitle1.copyWith(color: kWhiteColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 4, bottom: 2),
                        child: Icon(
                          Ionicons.star,
                          color: kPrimaryColor,
                          size: kIconSize9,
                        ),
                      ),
                      Text('4.8', style: kBody2TS.copyWith(color: kGreyColor)),
                      kSeporatorDot,
                      Text('12K ${S.of(context).action_reviews}',
                          style: kBody2TS.copyWith(color: kGreyColor)),
                      kSeporatorDot,
                      Expanded(
                          child: Text(
                        '2017',
                        style: kBody2TS.copyWith(
                          color: kGreyColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                  widget.isPurchased
                      ? Text(
                          '12/32',
                          style: kHeadline5.copyWith(color: kPrimaryColor),
                        )
                      : Text(
                          '59\$',
                          style: kHeadline5.copyWith(color: kPrimaryColor),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
