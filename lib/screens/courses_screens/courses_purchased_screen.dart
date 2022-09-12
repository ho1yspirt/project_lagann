import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../generated/l10n.dart';
import '../../utils/constants.dart';
import '../../widgets/card_widgets/course_item_card.dart';

class CoursesPurchasedScreen extends StatefulWidget {
  const CoursesPurchasedScreen({Key? key}) : super(key: key);

  @override
  State<CoursesPurchasedScreen> createState() => _CoursesPurchasedScreenState();
}

class _CoursesPurchasedScreenState extends State<CoursesPurchasedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              S.of(context).courses_screen_purchased,
              style: kHeadline4.copyWith(color: kWhiteColor),
            ),
            leading: IconButton(
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
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
