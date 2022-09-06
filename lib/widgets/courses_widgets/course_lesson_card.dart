import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/home_screens/home_screen.dart';

import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class CourseLessonCard extends StatelessWidget {
  final bool isPurchased;
  final int lessonIndex;
  const CourseLessonCard(
      {Key? key, required this.isPurchased, required this.lessonIndex})
      : super(key: key);

  void onTapLockedLesson(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: SizedBox(
          height: 230,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  S.of(context).course_screen_enroll_dialog_title,
                  style: kHeadline4.copyWith(color: kWhiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).course_screen_enroll_dialog_subtitle,
                    style: kBody1TS.copyWith(color: kWhiteColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: SizedBox(
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.only(left: 6),
      title: Text(
        'Some text for lesson 3D course duper puper good',
        style: kHeadline5.copyWith(color: kWhiteColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      subtitle: Text(
        '90 min',
        style: kBody2TS.copyWith(color: kGreyColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      leading: Container(
        height: 48,
        width: 48,
        decoration:
            const BoxDecoration(color: kSurfaceColor, shape: BoxShape.circle),
        child: Center(
          child: Text(
            '$lessonIndex',
            style: kHeadline4.copyWith(color: kPrimaryColor),
          ),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          if (isPurchased == false) {
            onTapLockedLesson(context);
          }
        },
        icon: lessonIndex == 1 || lessonIndex == 2 || isPurchased == true
            ? const Icon(
                Ionicons.play_circle,
                color: kPrimaryColor,
                size: kIconSize4,
              )
            : const Icon(
                Ionicons.lock_closed,
                color: kWhiteColor,
                size: kIconSize4,
              ),
      ),
    );
  }
}
