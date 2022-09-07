import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/widgets/marathon_widgets/statistics_tab_item.dart';

import '../../utils/constants.dart';

class TabBarStatistics extends StatelessWidget {
  const TabBarStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 33,
                            alignment: Alignment.center,
                            child: Text(
                              "#",
                              style: kSubtitle2.copyWith(color: kGreyColor),
                            ),
                          ),
                          Container(
                            width: 211,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Participant",
                              style: kSubtitle2.copyWith(color: kGreyColor),
                            ),
                          ),
                          Container(
                            width: 47,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Rating",
                              style: kSubtitle2.copyWith(color: kGreyColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 33,
                            alignment: Alignment.center,
                            child: const Icon(
                              Ionicons.trophy,
                              color: kPrimaryColor,
                              size: kIconSize7,
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
                                      "TOpchikTopchik",
                                      style: kSubtitle1.copyWith(
                                          color: kWhiteColor),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Netlandia",
                                      style: kSubtitle2.copyWith(
                                          color: kGreyColor),
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return StatisticsTabItem(index: index);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ]),
        Container(
          height: 55,
          color: kSurfaceColor,
          alignment: Alignment.bottomCenter,
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
                    "13",
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
        ),
      ],
    );
  }
}
