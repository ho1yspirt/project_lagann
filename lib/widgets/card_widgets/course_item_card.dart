import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';

import '../../generated/l10n.dart';

class CourseItemCard extends StatefulWidget {
  const CourseItemCard({Key? key}) : super(key: key);

  @override
  State<CourseItemCard> createState() => _CourseItemCardState();
}

class _CourseItemCardState extends State<CourseItemCard> {
  bool _isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '3D way of the samurai, and basics of 3D',
                      style: kSubtitle1.copyWith(color: kWhiteColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(
                          Ionicons.star,
                          color: kPrimaryColor,
                          size: kIconSize8,
                        ),
                      ),
                      Text('4.8', style: kBody2TS.copyWith(color: kGreyColor)),
                      kSeporatorDot,
                      Text('12K ${S.of(context).action_reviews}',
                          style: kBody2TS.copyWith(color: kGreyColor)),
                      kSeporatorDot,
                      Text('2017', style: kBody2TS.copyWith(color: kGreyColor)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '59\$',
                      style: kHeadline5.copyWith(color: kPrimaryColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
