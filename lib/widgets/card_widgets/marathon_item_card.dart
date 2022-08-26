import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';

class MarathonItemCard extends StatelessWidget {
  const MarathonItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
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
                      const Icon(
                        Ionicons.trophy_outline,
                        size: kIconSize7,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '3D way of the samurai',
                      style: kSubtitle1.copyWith(color: kWhiteColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    'The 3D path of the samurai begins with the first step and will always be difficult',
                    style: kBody2TS.copyWith(color: kGreyColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Text('25 contestants',
                            style: kBody2TS.copyWith(color: kGreyColor)),
                        kSeporatorDot,
                        Text('31 Feb 2017',
                            style: kBody2TS.copyWith(color: kGreyColor)),
                      ],
                    ),
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
