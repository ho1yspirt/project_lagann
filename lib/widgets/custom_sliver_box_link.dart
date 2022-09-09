import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';

import '../generated/l10n.dart';

class CustomSliverBoxLink extends StatelessWidget {
  final String title;
  final Function navigateTo;
  const CustomSliverBoxLink(
      {Key? key, required this.title, required this.navigateTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: kHeadline5.copyWith(color: kWhiteColor),
        ),
        InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              navigateTo();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              child: Text(
                S.of(context).action_see_all,
                style: kHeadline6.copyWith(color: kPrimaryColor),
              ),
            ))
      ]),
    );
  }
}
