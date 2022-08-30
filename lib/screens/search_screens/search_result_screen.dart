import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/widgets/card_widgets/course_item_card.dart';
import 'package:project_lagann/widgets/card_widgets/marathon_item_card.dart';
import 'package:project_lagann/widgets/card_widgets/short_post_item_card.dart';
import 'package:project_lagann/widgets/custom_dropdown_button.dart';
import 'package:project_lagann/widgets/search_widgets/search_filter_dialog.dart';
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

  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  void setIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
      _pageController.animateToPage(newIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    });
  }

  void onTapFilterContent(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => SearchFilterDialog(
        title: S.of(context).search_filter,
        widgetSet: [
          SearchFilterDialogItem(
            title: S.of(context).search_filter_sort_by,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).search_filter_relevance,
              items: [
                S.of(context).search_filter_relevance,
                S.of(context).search_filter_popularity,
                S.of(context).search_filter_like,
                S.of(context).search_filter_upload_date,
              ],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_upload_date,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).date_anytime,
              items: [
                S.of(context).date_anytime,
                S.of(context).date_last_hour,
                S.of(context).date_today,
                S.of(context).date_this_week,
                S.of(context).date_this_month,
                S.of(context).date_this_year,
              ],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_activity,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).search_filter_none,
              items: [
                S.of(context).search_filter_none,
                S.of(context).search_filter_viewed,
                S.of(context).search_filter_liked,
              ],
            ),
          ),
        ],
      ),
    );
  }

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
              onPressed: () {
                onTapFilterContent(context);
              },
              icon: const Icon(Ionicons.options_outline),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: CustomChoiceChips(
            selectedChipIndex: _currentIndex,
            chipsList: [
              ChipFilter('Top', () {
                setIndex(0);
              }),
              ChipFilter('ShortPosts', () {
                setIndex(1);
              }),
              ChipFilter('ProVideos', () {
                setIndex(2);
              }),
              ChipFilter('People', () {
                setIndex(3);
              }),
              ChipFilter('Marathons', () {
                setIndex(4);
              }),
              ChipFilter('Courses', () {
                setIndex(5);
              }),
              ChipFilter('Hashtags', () {
                setIndex(6);
              }),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          Scaffold(
            body: CustomScrollView(
              slivers: [
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
                    (BuildContext context, int index) {
                      return const MarathonItemCard();
                    },
                    childCount: 2,
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
                    childCount: 2,
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
              ],
            ),
          ),
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      childAspectRatio: 4.3 / 8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return const ShortPostItemCard();
                      },
                      childCount: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: CustomScrollView(
                slivers: [
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
            ),
          ),
          Scaffold(
            body: CustomScrollView(
              slivers: [
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
              ],
            ),
          ),
          Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const MarathonItemCard();
                    },
                    childCount: 15,
                  ),
                ),
              ],
            ),
          ),
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return const CourseItemCard();
                      },
                      childCount: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const SearchHashtagItem();
                    },
                    childCount: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
