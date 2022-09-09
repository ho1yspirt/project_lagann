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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                S.of(context).courses_screen_purchased,
                style: kHeadline5.copyWith(color: kWhiteColor),
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
          ],
        ),
      ),
    );
  }
}
