import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../generated/l10n.dart';
import '../utils/constants.dart';
import 'custom_home_button.dart';

class HomePostItem extends StatefulWidget {
  const HomePostItem({Key? key}) : super(key: key);

  @override
  State<HomePostItem> createState() => _HomePostItemState();
}

class _HomePostItemState extends State<HomePostItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16, bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 22,
                                      backgroundImage: NetworkImage(
                                          'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                                    ),
                                    const SizedBox(width: 4),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '@Andrew Pech',
                                          style: kSubtitle2,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Text(
                                              '700k views',
                                              style: kCaptionsTS,
                                            ),
                                            kSeporatorDot,
                                            const Text(
                                              '2 week ago',
                                              style: kCaptionsTS,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 318,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '#hashtags #hashtags #hashtags',
                                        style: kSubtitle2,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                          style: kBody2TS,
                                          'captions captions captions captions captions captions captions captions captions'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 8, bottom: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        const CustomHomeButton(
                                            icon: Icon(Ionicons.heart_outline),
                                            title: '500k'),
                                        const CustomHomeButton(
                                            icon: Icon(
                                                Ionicons.chatbubble_outline),
                                            title: '12k'),
                                        CustomHomeButton(
                                            icon: const Icon(
                                                Ionicons.bookmark_outline),
                                            title: S.of(context).action_save),
                                        CustomHomeButton(
                                            icon: const Icon(
                                                Ionicons.share_outline),
                                            title: S.of(context).action_share),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 380,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
    ;
  }
}
