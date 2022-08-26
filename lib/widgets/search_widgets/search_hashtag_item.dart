import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';

class SearchHashtagItem extends StatelessWidget {
  const SearchHashtagItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: kHashtagCircle,
        title: Text(
          'hashtag_item',
          style: kSubtitle2.copyWith(color: kWhiteColor),
        ),
        subtitle: Text(
          '64M Views',
          style: kCaptionsTS.copyWith(color: kGreyColor),
        ),
      ),
    );
  }
}
