import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/followed_screens.dart';
import 'package:project_lagann/screens/marathons_screen.dart';
import 'package:project_lagann/screens/notifications_screen.dart';
import 'package:project_lagann/screens/search_screen.dart';
import 'package:project_lagann/utils/constants.dart';
// import 'package:project_taskli/widgets/video_player_item.dart';
// import 'package:video_player/video_player.dart';

// TODO: create localize
// TODO: assign adaptive theme

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // TODO: create user model and connect data with widgets,
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentAppBarIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white.withOpacity(0.0), actions: [
        // Custom AppBar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: const Text('Marathons'),
              onTap: () {
                Navigator.push(
                  context,
                  // PageRouteBuilder(
                  //   pageBuilder: (c, a1, a2) => MarathonsScreen(),
                  //   transitionsBuilder: (c, anim, a2, child) =>
                  //       FadeTransition(opacity: anim, child: child),
                  //   transitionDuration: Duration(milliseconds: 2000),
                  // ),
                  MaterialPageRoute(
                    builder: (context) => const MarathonsScreen(),
                  ),
                );
              },
            ),
            kSeporatorLine,
            GestureDetector(
              child: const Text('Followed'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FollowedScreen(),
                  ),
                );
              },
            ),
            kSeporatorLine,
            GestureDetector(
              child: const Text('All'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Ionicons.search)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
                icon: const Icon(Ionicons.notifications)),
          ],
        ),
      ]),
      body: Stack(
        children: [
          PageView.builder(
            // itemCount: 0,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // TODO: implement videoplayer
                  // VideoPlayerItem(
                  //   videoUrl:
                  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                  // ),
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
                                  margin: const EdgeInsets.only(
                                      left: 16, bottom: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                                          ),
                                          const SizedBox(width: 4),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('@Andrew Pech'),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  const Text('700k views'),
                                                  kSeporatorDot,
                                                  const Text('2 week ago'),
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
                                            Text('#hashtags'),
                                            SizedBox(height: 4),
                                            Text(
                                                'captions captions captions captions captions captions captions captions captions'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 16, bottom: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              // TODO: create separate widgets
                                              // как лучше сделать?
                                              // GestureDetector(
                                              //   child: Icon(
                                              //     Ionicons.heart_outline,
                                              //     size: 32,
                                              //   ),
                                              //   onTap: () {},
                                              // ),
                                              IconButton(
                                                  iconSize: 32,
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Ionicons.heart_outline)),
                                              const Text('500k'),
                                              const SizedBox(height: 8),
                                              IconButton(
                                                  iconSize: 32,
                                                  onPressed: () {},
                                                  icon: const Icon(Ionicons
                                                      .chatbubble_outline)),
                                              const Text('12k'),
                                              const SizedBox(height: 8),
                                              IconButton(
                                                  iconSize: 32,
                                                  onPressed: () {},
                                                  icon: const Icon(Ionicons
                                                      .bookmark_outline)),
                                              const SizedBox(height: 8),
                                              const Text('Save'),
                                              IconButton(
                                                  iconSize: 32,
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Ionicons.share_outline)),
                                              const Text('Share'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
