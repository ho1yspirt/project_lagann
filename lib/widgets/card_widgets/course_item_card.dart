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
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        splashFactory: InkSparkle.splashFactory,
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseItemScreen(
                isPurchased: widget.isPurchased,
                isSaved: isSaved,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 32,
              // maxHeight: 130
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SizedBox(
                      // width: 160,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 320 / 226,
                          child: Image.network(
                            'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '3D Design',
                            style: kBody2TS.copyWith(color: kPrimaryColor),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {
                              setState(() {
                                isSaved = !isSaved;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: isSaved
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: widget.isPurchased
                            ? Text(
                                '12/32',
                                style:
                                    kHeadline5.copyWith(color: kPrimaryColor),
                              )
                            : Text(
                                '59\$',
                                style:
                                    kHeadline5.copyWith(color: kPrimaryColor),
                              ),
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
                          Text('4.8',
                              style: kBody2TS.copyWith(color: kGreyColor)),
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
                    ],
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
