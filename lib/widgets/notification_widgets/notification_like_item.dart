import 'package:flutter/material.dart';
// import 'package:timeago/timeago.dart' as timeago;
import '../../utils/constants.dart';

class NotificationLikeItem extends StatelessWidget {
  const NotificationLikeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 32),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                      'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'userName',
                          style: kSubtitle2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 1),
                            Row(
                              children: [
                                Text(
                                  'liked your ' 'video',
                                  overflow: TextOverflow.ellipsis,
                                  style: kBody2TS.copyWith(color: kGreyColor),
                                ),
                                kSeporatorDot,
                                Flexible(
                                  child: Text('5 hours ago',
                                      // timeago.format(
                                      //   commentModel.timestamp,
                                      //   allowFromNow: true,
                                      //),
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          kBody2TS.copyWith(color: kGreyColor)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                      'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                                ),
                                const Positioned(
                                  left: 16,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                        'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                                  ),
                                ),
                                const Positioned(
                                  left: 32,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                        'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                                  ),
                                ),
                                Positioned(left: 48, child: kThreeDotAvatar),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
