import 'package:flutter/material.dart';
import 'package:project_lagann/models/user.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/utils/constants.dart';

import '../generated/l10n.dart';
import '../widgets/widgets.dart';

class ProVideoHomeScreen extends StatefulWidget {
  const ProVideoHomeScreen({Key? key}) : super(key: key);

  @override
  State<ProVideoHomeScreen> createState() => _ProVideoHomeScreenState();
}

class _ProVideoHomeScreenState extends State<ProVideoHomeScreen> {
  List<bool> isCurrChapter = [false, true, false, false];
  int currentIndex = 1;

  void setChapter(int index) {
    setState(() {
      isCurrChapter[index] = true;
      isCurrChapter[currentIndex] = false;
      currentIndex = index;
    });
  }

  static const UserModel _testUser = UserModel(
    id: 1,
    username: "UX/UI:Structure",
    profileImageUrl:
        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
    subscribers: "2000",
  );

  final List<VideoModel> _testVideoList = [
    VideoModel(
      id: "1",
      author: _testUser,
      title: "Weather App UI Design in Figma - Full course",
      thumbnailUrl:
          "https://thumbs.dreamstime.com/b/d-mural-wallpaper-beautiful-view-landscape-background-old-arches-tree-sun-water-birds-flowers-transparent-curtains-166191190.jpg",
      videoUrl: "https://youtu.be/2XOciSjxocI",
      duration: "20",
      timestamp: DateTime(2021, 7, 15),
      viewCount: "8K",
      likes: "4775",
      dislikes: "177",
      commentsCount: "250",
    ),
    VideoModel(
      id: 'x606y4QWrxo',
      author: _testUser,
      title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
      thumbnailUrl: 'https://i.ytimg.com/vi/x606y4QWrxo/0.jpg',
      videoUrl: "https://youtu.be/2XOciSjxocI",
      duration: '8:20',
      timestamp: DateTime(2021, 3, 20),
      viewCount: '10K',
      likes: '958',
      dislikes: '4',
      commentsCount: "250",
    ),
    VideoModel(
      id: 'vrPk6LB9bjo',
      author: _testUser,
      title:
          'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture',
      thumbnailUrl: 'https://i.ytimg.com/vi/vrPk6LB9bjo/0.jpg',
      videoUrl: "https://youtu.be/2XOciSjxocI",
      duration: '22:06',
      timestamp: DateTime(2021, 2, 26),
      viewCount: '8K',
      likes: '485',
      dislikes: '8',
      commentsCount: "250",
    ),
    VideoModel(
      id: 'ilX5hnH8XoI',
      author: _testUser,
      title: 'Flutter Instagram Stories',
      thumbnailUrl: 'https://i.ytimg.com/vi/ilX5hnH8XoI/0.jpg',
      videoUrl: "https://youtu.be/2XOciSjxocI",
      duration: '10:53',
      timestamp: DateTime(2022, 8, 7),
      viewCount: '18K',
      likes: '1k',
      dislikes: '4',
      commentsCount: "250",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SlivAppBar(
            title: S.of(context).navbar_pro_video,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 42,
                margin: const EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () => setChapter(0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isCurrChapter[0]
                              ? kWhiteColor
                              : kSurfaceColorWithOpacity,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        margin: kChapterPadding,
                        width: 90,
                        height: 32,
                        child: Text(
                          "Trending",
                          style: isCurrChapter[0]
                              ? kChapterActiveTS
                              : kChapterDefaultTS,
                        ),
                      ),
                    ),

                    // seporator
                    Container(
                      height: 27,
                      padding:
                          const EdgeInsets.only(bottom: 3, right: 12, left: 12),
                      alignment: Alignment.bottomCenter,
                      child: kSeporatorLine,
                    ),

                    GestureDetector(
                      onTap: () => setChapter(1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isCurrChapter[1]
                              ? kWhiteColor
                              : kSurfaceColorWithOpacity,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        margin: kChapterPadding,
                        width: 44,
                        height: 32,
                        child: Text(
                          "All",
                          style: isCurrChapter[1]
                              ? kChapterActiveTS
                              : kChapterDefaultTS,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setChapter(2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isCurrChapter[2]
                              ? kWhiteColor
                              : kSurfaceColorWithOpacity,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        margin: kChapterPadding,
                        width: 120,
                        height: 32,
                        child: Text(
                          "Subscription",
                          style: isCurrChapter[2]
                              ? kChapterActiveTS
                              : kChapterDefaultTS,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setChapter(3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isCurrChapter[3]
                              ? kWhiteColor
                              : kSurfaceColorWithOpacity,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        margin: kChapterPadding,
                        width: 90,
                        height: 32,
                        child: Text(
                          "Watched",
                          style: isCurrChapter[3]
                              ? kChapterActiveTS
                              : kChapterDefaultTS,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = _testVideoList[index];
                return VideoCard(videoModel: video);
              },
              childCount: _testVideoList.length,
            ),
          ),
        ],
      ),
    );
  }
}
