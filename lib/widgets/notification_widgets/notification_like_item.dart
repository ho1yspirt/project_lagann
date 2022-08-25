import 'package:flutter/material.dart';
// import 'package:timeago/timeago.dart' as timeago;
import '../../utils/constants.dart';

class NotificationLikeItem extends StatelessWidget {
  const NotificationLikeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 6, left: 16, right: 16),
        leading: const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
              'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
        ),
        title: const Text(
          'userName',
          style: kSubtitle2,
        ),
        subtitle: Column(
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
                      style: kBody2TS.copyWith(color: kGreyColor)),
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
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
