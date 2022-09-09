import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/widgets/courses_widgets/course_lesson_card.dart';
import 'package:project_lagann/widgets/courses_widgets/course_review_card.dart';
import 'package:project_lagann/widgets/custom_choice_chips.dart';
import '../../generated/l10n.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_tabbar_indicator.dart';
import 'package:flutter/services.dart';
import 'dart:math';

Random random = Random();

// ignore: must_be_immutable
class CourseItemScreen extends StatefulWidget {
  final bool isPurchased;
  bool isSaved;
  CourseItemScreen({Key? key, required this.isPurchased, required this.isSaved})
      : super(key: key);

  @override
  State<CourseItemScreen> createState() => _CourseItemScreenState();
}

class _CourseItemScreenState extends State<CourseItemScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        title: Text(S.of(context).courses_screen_course),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.chatbubbles_outline,
              size: kIconSize7,
            ),
          ),
          PopupMenuButton(
            icon: const Icon(
              Ionicons.ellipsis_vertical_outline,
              size: kIconSize7,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    widget.isSaved = !widget.isSaved;
                  });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        widget.isSaved
                            ? Ionicons.bookmark
                            : Ionicons.bookmark_outline,
                        size: kIconSize5,
                        color: widget.isSaved ? kPrimaryColor : kWhiteColor,
                      ),
                    ),
                    Text(
                      S.of(context).action_save,
                      style: kSubtitle1.copyWith(color: kWhiteColor),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Ionicons.share_outline,
                        size: kIconSize5,
                      ),
                    ),
                    Text(
                      S.of(context).action_share,
                      style: kSubtitle1.copyWith(color: kWhiteColor),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Ionicons.help_outline,
                        size: kIconSize5,
                      ),
                    ),
                    Text(
                      S.of(context).action_help_and_feedback,
                      style: kSubtitle1.copyWith(color: kWhiteColor),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Ionicons.flag_outline,
                        size: kIconSize5,
                      ),
                    ),
                    Text(
                      S.of(context).action_report,
                      style: kSubtitle1.copyWith(color: kWhiteColor),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 32,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Visual 3d Course',
                                    style:
                                        kHeadline4.copyWith(color: kWhiteColor),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 2),
                                        child: Icon(
                                          Ionicons.star,
                                          color: kPrimaryColor,
                                          size: kIconSize8,
                                        ),
                                      ),
                                      Text(
                                        '4.8 (3K ${S.of(context).action_reviews})',
                                        style: kBody2TS.copyWith(
                                            color: kGreyColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: S
                                                .of(context)
                                                .course_screen_created_by,
                                            style: kSubtitle1.copyWith(
                                                color: kWhiteColor),
                                          ),
                                          TextSpan(
                                            text: ' Andrew Pech',
                                            style: kSubtitle1.copyWith(
                                                color: kPrimaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    kSeporatorDot,
                                    Text(
                                      '27 Dec 2021',
                                      style:
                                          kBody2TS.copyWith(color: kWhiteColor),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: Icon(
                                          Ionicons.book,
                                          size: kIconSize8,
                                          color: kGreyColor,
                                        ),
                                      ),
                                      Text(
                                        '66 ${S.of(context).course_screen_lessons}',
                                        style: kBody2TS.copyWith(
                                            color: kGreyColor),
                                      ),
                                      kSeporatorDot,
                                      Text(
                                        '6K ${S.of(context).course_screen_students}',
                                        style: kBody2TS.copyWith(
                                            color: kGreyColor),
                                      )
                                    ],
                                  ),
                                  widget.isPurchased
                                      ? Text(
                                          '12/32',
                                          style: kHeadline5.copyWith(
                                              color: kPrimaryColor),
                                        )
                                      : Text(
                                          '59\$',
                                          style: kHeadline5.copyWith(
                                              color: kPrimaryColor),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: kSurfaceColor.withAlpha(120),
                        ),
                      ],
                    ),
                  ),
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      elevation: 1,
                      shadowColor: kSurfaceColor,
                      forceElevated: true,
                      automaticallyImplyLeading: false,
                      toolbarHeight: 0,
                      pinned: true,
                      bottom: TabBar(
                        controller: _tabController,
                        splashBorderRadius: BorderRadius.circular(5),
                        indicatorColor: kPrimaryColor,
                        indicatorWeight: 4,
                        indicator:
                            const CustomTabIndicator(color: kPrimaryColor),
                        tabs: [
                          Tab(
                            child: Text(
                              S.of(context).action_about,
                              style: kHeadline5.copyWith(color: kWhiteColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              S.of(context).course_screen_lessons,
                              style: kHeadline5.copyWith(color: kWhiteColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              S.of(context).action_reviews,
                              style: kHeadline5.copyWith(color: kWhiteColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(top: 52, bottom: 30),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.of(context).course_screen_about_course,
                                      style: kHeadline5.copyWith(
                                          color: kWhiteColor),
                                    ),
                                    Text(
                                      '3D DESIGN',
                                      style: kBody2TS.copyWith(
                                          color: kPrimaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                  overflow: TextOverflow.fade,
                                  style: kBody2TS.copyWith(color: kWhiteColor),
                                  'Mus, a nunc ridiculus, sagittis sem quam praesent, class, class dictumst facilisis fames quisque orci platea placerat mollis nibh. Neque rhoncus per. Dis dictumst nec sodales justo sociis dictum. Facilisis vivamus suscipit. Fringilla imperdiet elementum montes phasellus placerat nonummy lectus nullam eu rhoncus imperdiet tristique nunc eget eu fusce, dapibus vitae. Curabitur hac montes orci inceptos est consectetuer. Fames. Condimentum lectus nascetur nascetur hendrerit nonummy morbi inceptos lacinia nunc Convallis taciti, eu aenean faucibus mattis malesuada ligula vulputate. Pretium in tincidunt Cras cras velit torquent convallis nisi. Ipsum lorem duis scelerisque urna est laoreet. Semper adipiscing euismod et at dictumst\n\nMus, a nunc ridiculus, sagittis sem quam praesent, class, class dictumst facilisis fames quisque orci platea placerat mollis nibh. Neque rhoncus per. Dis dictumst nec sodales justo sociis dictum. Facilisis vivamus suscipit. Fringilla imperdiet elementum montes phasellus placerat nonummy lectus nullam eu rhoncus imperdiet tristique nunc eget eu fusce, dapibus vitae. Curabitur hac montes orci inceptos est consectetuer. Fames. Condimentum lectus nascetur nascetur hendrerit nonummy morbi inceptos lacinia nunc Convallis taciti, eu aenean faucibus mattis malesuada ligula vulputate. Pretium in tincidunt Cras cras velit torquent convallis nisi. Ipsum lorem duis scelerisque urna est laoreet. Semper adipiscing euismod et at dictumst \n\nMus, a nunc ridiculus, sagittis sem quam praesent, class, class dictumst facilisis fames quisque orci platea placerat mollis nibh. Neque rhoncus per. Dis dictumst nec sodales justo sociis dictum. Facilisis vivamus suscipit. Fringilla imperdiet elementum montes phasellus placerat nonummy lectus nullam eu rhoncus imperdiet tristique nunc eget eu fusce, dapibus vitae. Curabitur hac montes orci inceptos est consectetuer. Fames. Condimentum lectus nascetur nascetur hendrerit nonummy morbi inceptos lacinia nunc Convallis taciti, eu aenean faucibus mattis malesuada ligula vulputate. Pretium in tincidunt Cras cras velit torquent convallis nisi. Ipsum lorem duis scelerisque urna est laoreet. Semper adipiscing euismod et at dictumst'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 2),
                            child: Text(
                              S.of(context).course_screen_lessons,
                              style: kHeadline5.copyWith(color: kWhiteColor),
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, int index) {
                              return CourseLessonCard(
                                isPurchased: widget.isPurchased,
                                lessonIndex: index + 1,
                              );
                            },
                            childCount: 50,
                          ),
                        ),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: CustomChoiceChips(
                            selectedChipIndex: 0,
                            chipsList: [
                              ChipFilter(
                                S.of(context).home_screen_all,
                                () {},
                              ),
                              ChipFilter('5', () {}, icon: starIcon),
                              ChipFilter('4', () {}, icon: starIcon),
                              ChipFilter('3', () {}, icon: starIcon),
                              ChipFilter('2', () {}, icon: starIcon),
                              ChipFilter('1', () {}, icon: starIcon),
                            ],
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, int index) {
                              return CourseReviewCard(
                                isRating: random.nextInt(5) + 1,
                              );
                            },
                            childCount: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            widget.isPurchased
                ? const SizedBox.shrink()
                : Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 15.5,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 50,
                        child: Center(
                          child: Text(
                            '${S.of(context).course_screen_enroll_course.toUpperCase()} - \$59',
                            style: kButtonTS.copyWith(color: kWhiteColor),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
