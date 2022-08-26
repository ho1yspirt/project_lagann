import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/widgets/card_widgets/course_item_card.dart';
import 'package:project_lagann/widgets/card_widgets/marathon_item_card.dart';
import 'package:project_lagann/widgets/card_widgets/short_post_item_card.dart';
import '../../generated/l10n.dart';
import '../../models/user.dart';
import '../../models/video.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_choice_chips.dart';
import '../../widgets/search_widgets/search_hashtag_item.dart';
import '../../widgets/search_widgets/search_user_item.dart';
import '../../widgets/video_card.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final TextEditingController _textController = TextEditingController();

  final List<UserModel> _testUserList = [
    const UserModel(
      id: 1,
      username: "andrew_pech",
      profileImageUrl:
          'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
      subscribers: "69",
    ),
    const UserModel(
      id: 2,
      username: "lox",
      profileImageUrl:
          'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
      subscribers: "228",
    ),
  ];

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        title: SizedBox(
          height: 40,
          child: TextFormField(
            controller: _textController,
            cursorColor: kPrimaryColor,
            cursorRadius: const Radius.circular(5),
            decoration: InputDecoration(
                hintText: S.of(context).action_search,
                suffixIcon: _textController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          _textController.clear();
                          setState(() {});
                        },
                        child: const Icon(
                          Ionicons.close,
                          size: kIconSize8,
                          color: kWhiteColor,
                        ),
                      )
                    : null),
            onChanged: (text) {
              setState(() {});
            },
            // TODO: implement method of searchcpntroller
            // onFieldSubmitted: (value) => searchController.(value),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.options_outline),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 42,
                  child: CustomChoiceChips(
                    selectedChipIndex: 0,
                    chipsList: [
                      ChipFilter('Top', () {}),
                      ChipFilter('Posts', () {}),
                      ChipFilter('People', () {}),
                      ChipFilter('Marathons', () {}),
                      ChipFilter('Courses', () {}),
                      ChipFilter('Hashtags', () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final user = _testUserList[index];
                return SearchUserItem(
                  userModel: user,
                );
              },
              childCount: _testUserList.length,
            ),
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
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const ShortPostItemCard();
              },
              childCount: 3,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SearchHashtagItem(),
                const SearchHashtagItem(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const MarathonItemCard();
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
