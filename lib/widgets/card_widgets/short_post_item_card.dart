import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';

class ShortPostItemCard extends StatelessWidget {
  const ShortPostItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 16,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 16,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.network(
                        'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Text(
                      'Learn how to draw a girl in adobe illustrator',
                      style: kBody1TS.copyWith(color: kWhiteColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 16,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(
                          'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          'user_name',
                          style: kCaptionsTS.copyWith(color: kWhiteColor),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '74K Likes',
                            style: kCaptionsTS.copyWith(color: kGreyColor),
                          ),
                          kSeporatorDot,
                          Text(
                            '124K Views',
                            style: kCaptionsTS.copyWith(color: kGreyColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
