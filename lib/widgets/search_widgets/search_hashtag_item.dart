import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';

class SearchHashtagItem extends StatelessWidget {
  const SearchHashtagItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 32,
              maxHeight: 56,
              minHeight: 48,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kHashtagCircle,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'hashtag_item',
                          style: kSubtitle2.copyWith(color: kWhiteColor),
                        ),
                        Text(
                          '64M Views',
                          style: kCaptionsTS.copyWith(color: kGreyColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // ListTile(
    //   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    //   leading: kHashtagCircle,
    //   title: Text(
    //     'hashtag_item',
    //     style: kSubtitle2.copyWith(color: kWhiteColor),
    //   ),
    //   subtitle: Text(
    //     '64M Views',
    //     style: kCaptionsTS.copyWith(color: kGreyColor),
    //   ),
    // ),
    // );
  }
}
