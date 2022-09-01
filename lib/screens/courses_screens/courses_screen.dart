import 'package:flutter/material.dart';
import 'package:project_lagann/screens/courses_screens/courses_purchased_screen.dart';
import 'package:project_lagann/widgets/card_widgets/course_item_card.dart';
import 'package:project_lagann/widgets/custom_sliver_box_link.dart';

import '../../generated/l10n.dart';
import '../../widgets/pro_video_widgets/sliver_appbar.dart';
import 'courses_all_screen.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SlivAppBar(title: S.of(context).navbar_courses),
          SliverToBoxAdapter(
            child: CustomSliverBoxLink(
              title: S.of(context).courses_screen_purchased,
              navigateTo: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CoursesPurchasedScreen(),
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const CourseItemCard(
                  isPurchased: true,
                );
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomSliverBoxLink(
              title: S.of(context).navbar_courses,
              navigateTo: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CoursesAllScreen(),
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const CourseItemCard(
                  isPurchased: false,
                );
              },
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
