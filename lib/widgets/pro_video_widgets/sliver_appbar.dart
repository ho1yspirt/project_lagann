import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/notification_screens/notifications_screen.dart';
import '../../screens/search_screens/search_screen.dart';
import '../../utils/constants.dart';

class SlivAppBar extends StatelessWidget {
  final String title;
  final Widget? customLeading;
  final PreferredSizeWidget? bottom;
  const SlivAppBar({Key? key, this.title = '', this.customLeading, this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 8,
      floating: true,
      backgroundColor: kBackgroundColor,
      leading: customLeading,
      title: Text(
        title,
        style: kHeadline4.copyWith(color: kWhiteColor),
      ),
      bottom: bottom,
      actions: <Widget>[
        IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            ),
          },
          icon: const Icon(
            Ionicons.search,
            size: kIconSize7,
          ),
        ),
        IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            ),
          },
          icon: const Icon(
            Ionicons.notifications,
            size: kIconSize7,
          ),
        ),
      ],
    );
  }
}
