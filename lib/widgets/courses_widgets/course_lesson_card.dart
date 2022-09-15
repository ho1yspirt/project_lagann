import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/models/video.dart';
import 'package:project_lagann/screens/courses_screens/course_video_screen.dart';
import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class CourseLessonCard extends StatelessWidget {
  final bool isPurchased;
  final int lessonIndex;
  final VideoModel videoModel;
  const CourseLessonCard(
      {Key? key,
      required this.isPurchased,
      required this.lessonIndex,
      required this.videoModel})
      : super(key: key);

  void onTapLesson(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseVideoSCreen(
          videoModel: videoModel,
          isPurchased: isPurchased,
        ),
      ),
    );
  }

  void onTapLockedLesson(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (isPurchased == false && lessonIndex != 1 && lessonIndex != 2) {
            onTapLockedLesson(context);
          } else {
            onTapLesson(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                        color: kSurfaceColor, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        '$lessonIndex',
                        style: kHeadline4.copyWith(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Some text for lesson 3D course duper puper good',
                          style: kHeadline5.copyWith(color: kWhiteColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        '90 min',
                        style: kBody2TS.copyWith(color: kGreyColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (isPurchased == false &&
                        lessonIndex != 1 &&
                        lessonIndex != 2) {
                      onTapLockedLesson(context);
                    } else {
                      onTapLesson(context);
                    }
                  },
                  icon: lessonIndex == 1 ||
                          lessonIndex == 2 ||
                          isPurchased == true
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
