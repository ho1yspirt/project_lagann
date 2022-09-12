import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/marathon_screens/detailed_screen.dart';
import 'package:project_lagann/utils/constants.dart';

import '../../models/marathon.dart';

class MarathonItemCard extends StatelessWidget {
  final MarathonModel? marathonModel;

  const MarathonItemCard({
    Key? key,
    this.marathonModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MarathonDetailedScreen(marathonModel!),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 32,
              maxHeight: 150,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    marathonModel?.previewPhoto[0] ??
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              marathonModel?.category ?? "3D Desing",
                              style: kBody2TS.copyWith(color: kPrimaryColor),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Ionicons.trophy,
                                size: kIconSize7,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          marathonModel?.name ?? "3D way of the samurai",
                          style: kSubtitle1.copyWith(color: kWhiteColor),
                        ),
                        Text(
                          marathonModel?.description ??
                              "The 3D path of the samurai begins with the first step and will always be difficult...",
                          style: kBody2TS.copyWith(color: kGreyColor),
                          overflow: TextOverflow.ellipsis,
                          strutStyle: const StrutStyle(leading: 0.2),
                          maxLines: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            marathonModel?.price ??
                                marathonModel?.stagesQantyti ??
                                marathonModel?.participantsQantyti ??
                                "50\$",
                            style: kHeadline5.copyWith(color: kPrimaryColor),
                          ),
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
        ),
      ),
    );
  }
}
