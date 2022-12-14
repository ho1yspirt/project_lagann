import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';

class CourseReviewCard extends StatelessWidget {
  final int isRating;
  const CourseReviewCard({
    Key? key,
    required this.isRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                            'https://cdn.discordapp.com/avatars/548904505471926292/ca366fbb3dcd6c81f9c1fc547679df3d.webp?size=100'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name Some',
                            style: kSubtitle2.copyWith(color: kWhiteColor),
                          ),
                          Text(
                            '43 minutes ago',
                            style: kBody2TS.copyWith(color: kGreyColor),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$isRating',
                          style: kHeadline6.copyWith(color: kWhiteColor),
                        ),
                        starIcon,
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                  'some comment rich text Mus, a nunc ridiculus, sagittis sem quam praesent, class, class dictumst facilisis fames quisque orci platea placerat mollis nibh. Neque rhoncus per. Dis dictumst nec sodales justo sociis dictum. Facilisis vivamus suscipit. Fringilla imperdiet elementum montes phasellus placerat nonummy lectus nullam eu rhoncus imperdiet tristique nunc eget eu fusce, dapibus vitae. Curabitur hac montes orci inceptos est consectetuer. Fames. Condimentum lectus nascetur nascetur hendrerit nonummy morbi inceptos lacinia nunc Convallis taciti, eu aenean faucibus mattis malesuada ligula vulputate. Pretium in tincidunt Cras cras velit torquent convallis nisi. Ipsum lorem duis scelerisque urna est laoreet. Semper adipiscing euismod et at dictumst'),
            ],
          ),
        ),
      ),
    );
  }
}
