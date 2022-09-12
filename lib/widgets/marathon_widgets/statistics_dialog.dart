import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/constants.dart';

class StatisticsDialog extends StatelessWidget {
  const StatisticsDialog({Key? key}) : super(key: key);

  Widget _buildRatingItem(int starsCount) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              width: 130,
              height: 30,
              child: ListView.builder(
                itemCount: starsCount,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, _) => const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Ionicons.star,
                    color: kPrimaryColor,
                    size: kIconSize8,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 20,
              alignment: Alignment.bottomCenter,
              child: Text(
                "23338",
                style: kBody2TS.copyWith(color: kWhiteColor),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Ionicons.person,
              color: kWhiteColor,
              size: kIconSize8,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kSurfaceColor,
      elevation: 10,
      child: SizedBox(
        height: 306,
        width: 258,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Ionicons.trophy,
                        color: kPrimaryColor,
                        size: kIconSize7,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "4.8",
                            style: kHeadline4.copyWith(color: kWhiteColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Ionicons.star,
                            color: kPrimaryColor,
                            size: kIconSize8,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "TOpchikTopchik",
                    style: kSubtitle1.copyWith(color: kWhiteColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Netlandia",
                    style: kSubtitle2.copyWith(
                      color: kGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 6, right: 22),
              height: 2,
              color: kBackgroundColor,
            ),
            ListView.builder(
                itemCount: 5,
                reverse: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildRatingItem(index + 1);
                }),
          ],
        ),
      ),
    );
  }
}
