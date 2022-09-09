import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/widgets/custom_choice_chips.dart';
import '../../generated/l10n.dart';
import '../../widgets/card_widgets/course_item_card.dart';

class CoursesAllScreen extends StatefulWidget {
  const CoursesAllScreen({Key? key}) : super(key: key);

  @override
  State<CoursesAllScreen> createState() => _CoursesAllScreenState();
}

class _CoursesAllScreenState extends State<CoursesAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              S.of(context).navbar_courses,
              style: kHeadline4.copyWith(color: kWhiteColor),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              icon: const Icon(Ionicons.arrow_back_outline),
            ),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 55),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CustomChoiceChips(
                  selectedChipIndex: 0,
                  chipsList: [
                    ChipFilter('provide list', () {}),
                    ChipFilter('list', () {}),
                    ChipFilter('provide', () {}),
                    ChipFilter('list', () {}),
                    ChipFilter('provide', () {}),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const CourseItemCard(
                  isPurchased: false,
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
