import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/constants.dart';

class StatisticsTabItem extends StatefulWidget {
  final int? index;
  const StatisticsTabItem({Key? key, this.index}) : super(key: key);

  @override
  State<StatisticsTabItem> createState() => _StatisticsTabItemState();
}

class _StatisticsTabItemState extends State<StatisticsTabItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: SizedBox(
        width: 375,
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 33,
              alignment: Alignment.center,
              child: Text(
                (widget.index ?? 12 + 2).toString(),
                style: kHeadline4.copyWith(color: kPrimaryColor),
              ),
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  foregroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 167,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MaratTop",
                        style: kSubtitle1.copyWith(color: kWhiteColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Netlandia",
                        style: kSubtitle2.copyWith(color: kGreyColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 44,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  const Icon(
                    Ionicons.star,
                    color: kPrimaryColor,
                    size: kIconSize9,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "4.8",
                    style: kSubtitle2.copyWith(color: kGreyColor),
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
