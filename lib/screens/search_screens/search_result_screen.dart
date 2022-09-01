import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/widgets/card_widgets/course_item_card.dart';
import 'package:project_lagann/widgets/card_widgets/marathon_item_card.dart';
import 'package:project_lagann/widgets/card_widgets/short_post_item_card.dart';
import 'package:project_lagann/widgets/custom_dropdown_button.dart';
import 'package:project_lagann/widgets/custom_sliver_box_link.dart';
import 'package:project_lagann/widgets/search_widgets/search_filter_dialog.dart';
import '../../generated/l10n.dart';
import '../../models/user.dart';
import '../../models/video.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_tabbar_indicator.dart';
import '../../widgets/search_widgets/search_hashtag_item.dart';
import '../../widgets/search_widgets/search_user_item.dart';
import '../../widgets/pro_video_widgets/video_card.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen>
    with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  changeMyTab() {
    setState(() {
      _tabController.index = 2;
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

  void onTapFilterUser(BuildContext context) {
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
              ],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_accent,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).home_screen_all,
              items: [
                S.of(context).home_screen_all,
                S.of(context).search_filter_user_name,
                S.of(context).search_filter_channel_name,
              ],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).navbar_profile,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).home_screen_all,
              items: [
                S.of(context).home_screen_all,
                S.of(context).search_filter_signed,
                S.of(context).search_filter_friends,
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTapFilterMarathon(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => SearchFilterDialog(
        title: S.of(context).search_filter,
        widgetSet: [
          SearchFilterDialogItem(
            title: S.of(context).search_filter_categories,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).home_screen_all,
              items: [S.of(context).home_screen_all, 'provide list'],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_subcategory,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).home_screen_all,
              items: [S.of(context).home_screen_all, 'provide list'],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_sort_by,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).search_filter_relevance,
              items: [
                S.of(context).search_filter_relevance,
                S.of(context).search_filter_popularity,
                S.of(context).search_filter_upload_date,
              ],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_status,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).home_screen_all,
              items: [
                S.of(context).home_screen_all,
                S.of(context).search_filter_announced,
                S.of(context).search_filter_active,
                S.of(context).search_filter_ended,
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
        ],
        optionalWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                S.of(context).search_filter_price,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        cursorRadius: const Radius.circular(5),
                        decoration: InputDecoration(
                          hintText: S.of(context).count_from,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        cursorRadius: const Radius.circular(5),
                        decoration: InputDecoration(
                          hintText: S.of(context).count_to,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapFilterCourse(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => SearchFilterDialog(
        title: S.of(context).search_filter,
        widgetSet: [
          SearchFilterDialogItem(
            title: S.of(context).search_filter_categories,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).home_screen_all,
              items: [S.of(context).home_screen_all, 'provide list'],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_subcategory,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).home_screen_all,
              items: [S.of(context).home_screen_all, 'provide list'],
            ),
          ),
          SearchFilterDialogItem(
            title: S.of(context).search_filter_sort_by,
            customDropDownButton: CustomDropDownButton(
              selectedItem: S.of(context).search_filter_relevance,
              items: [
                S.of(context).search_filter_relevance,
                S.of(context).search_filter_popularity,
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
        ],
        optionalWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                S.of(context).search_filter_price,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        cursorRadius: const Radius.circular(5),
                        decoration: InputDecoration(
                          hintText: S.of(context).count_from,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        cursorRadius: const Radius.circular(5),
                        decoration: InputDecoration(
                          hintText: S.of(context).count_to,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      description: "some desc",
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
      description: "some desc",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: kSurfaceColor,
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
                if (_tabController.index == 3) {
                  onTapFilterUser(context);
                } else if (_tabController.index == 4) {
                  onTapFilterMarathon(context);
                } else if (_tabController.index == 5) {
                  onTapFilterCourse(context);
                } else {
                  onTapFilterContent(context);
                }
              },
              icon: const Icon(Ionicons.options_outline),
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          splashBorderRadius: BorderRadius.circular(5),
          indicatorColor: kPrimaryColor,
          indicatorWeight: 4,
          indicator: const CustomTabIndicator(color: kPrimaryColor),
          isScrollable: true,
          tabs: [
            Tab(
              child: Text(
                S.of(context).action_top,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Tab(
              child: Text(
                'ShortPosts',
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Tab(
              child: Text(
                S.of(context).navbar_pro_video,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Tab(
              child: Text(
                S.of(context).action_people,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Tab(
              child: Text(
                S.of(context).navbar_marathons,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Tab(
              child: Text(
                S.of(context).navbar_courses,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
            Tab(
              child: Text(
                S.of(context).action_hashtags,
                style: kHeadline5.copyWith(color: kWhiteColor),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomSliverBoxLink(
                    title: S.of(context).action_hashtags,
                    navigateTo: () {
                      _tabController.animateTo(6);
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const SearchHashtagItem();
                    },
                    childCount: 2,
                  ),
                ),
                SliverToBoxAdapter(
                    child: CustomSliverBoxLink(
                  title: S.of(context).action_people,
                  navigateTo: () {
                    _tabController.animateTo(3);
                  },
                )),
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
                SliverToBoxAdapter(
                    child: CustomSliverBoxLink(
                        title: S.of(context).navbar_marathons,
                        navigateTo: () {
                          _tabController.animateTo(4);
                        })),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const MarathonItemCard();
                    },
                    childCount: 2,
                  ),
                ),
                SliverToBoxAdapter(
                    child: CustomSliverBoxLink(
                        title: S.of(context).navbar_courses,
                        navigateTo: () {
                          _tabController.animateTo(5);
                        })),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const CourseItemCard(
                        isPurchased: true,
                      );
                    },
                    childCount: 2,
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomSliverBoxLink(
                      title: 'ShortPosts',
                      navigateTo: () {
                        _tabController.animateTo(1);
                      }),
                )),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5 / 8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const ShortPostItemCard();
                    },
                    childCount: 2,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomSliverBoxLink(
                      title: S.of(context).navbar_pro_video,
                      navigateTo: () {
                        _tabController.animateTo(2);
                      },
                    ),
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
              padding: const EdgeInsets.only(top: 2),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return const CourseItemCard(
                          isPurchased: false,
                        );
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
