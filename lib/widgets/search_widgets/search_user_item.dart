import 'package:flutter/material.dart';
import 'package:project_lagann/models/user.dart';
import '../../generated/l10n.dart';
import '../../utils/constants.dart';

class SearchUserItem extends StatelessWidget {
  final UserModel userModel;
  const SearchUserItem({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(userModel.profileImageUrl),
        ),
        title: Text(
          userModel.username,
          style: kSubtitle2,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        trailing: GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).action_subscribe.toUpperCase(),
            style: kButtonTS.copyWith(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
