import 'package:flutter/material.dart';
import 'package:project_lagann/models/user.dart';
import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class SearchUserItem extends StatelessWidget {
  final UserModel userModel;
  const SearchUserItem({Key? key, required this.userModel}) : super(key: key);

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
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(userModel.profileImageUrl),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userModel.username,
                          style: kSubtitle2,
                        ),
                        const Text('adobexpg', style: kBody2TS),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              '${userModel.subscribers} ${S.of(context).count_subscribers}',
                              style: kCaptionsTS.copyWith(color: kGreyColor),
                            ),
                            kSeporatorDot,
                            Flexible(
                              child: Text(
                                '670 ${S.of(context).count_posts}',
                                overflow: TextOverflow.ellipsis,
                                style: kCaptionsTS.copyWith(color: kGreyColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 2,
                    ),
                    child: Text(
                      S.of(context).action_subscribe.toUpperCase(),
                      style: kButtonTS.copyWith(color: kPrimaryColor),
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
}
