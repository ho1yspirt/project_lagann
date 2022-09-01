import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/constants.dart';

class MarathonHomeItem extends StatelessWidget {
  const MarathonHomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100",
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width - 132,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "3D Design",
                          style: kBody2TS.copyWith(color: kPrimaryColor),
                        ),
                        const Icon(
                          Ionicons.trophy,
                          size: kIconSize8,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "3D way of the samurai",
                      style: kSubtitle1.copyWith(color: kWhiteColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "The 3D path of the samurai begins with the first step and will always be difficult lorem ipsum dolor fade transition",
                      style: kBody2TS.copyWith(color: kGreyColor),
                      overflow: TextOverflow.ellipsis,
                      strutStyle: const StrutStyle(leading: 0.2),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "#195",
                      style: kHeadline5.copyWith(color: kPrimaryColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          "25 contestant",
                          style: kVideoInfoTS,
                        ),
                        kSeporatorDot,
                        const Text(
                          "31 Feb 2017",
                          style: kVideoInfoTS,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
