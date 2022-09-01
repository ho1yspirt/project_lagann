import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../generated/l10n.dart';
import '../../widgets/card_widgets/course_item_card.dart';
import '../../widgets/pro_video_widgets/sliver_appbar.dart';

class CoursesPurchasedScreen extends StatefulWidget {
  const CoursesPurchasedScreen({Key? key}) : super(key: key);

  @override
  State<CoursesPurchasedScreen> createState() => _CoursesPurchasedScreenState();
}

class _CoursesPurchasedScreenState extends State<CoursesPurchasedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: CustomScrollView(
          slivers: [
            SlivAppBar(
              title: S.of(context).courses_screen_purchased,
              customLeading: IconButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                icon: const Icon(Ionicons.arrow_back_outline),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const CourseItemCard(
                    isPurchased: true,
                  );
                },
                childCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
