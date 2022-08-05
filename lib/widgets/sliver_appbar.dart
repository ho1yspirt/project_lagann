import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/notifications_screen.dart';

import '../screens/search_screen.dart';
import '../utils/constants.dart';

class SlivAppBar extends StatelessWidget {
  const SlivAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 120,
      backgroundColor: kBackgroundColor,
      leading: Padding(
        padding: EdgeInsets.only(left: 16, top: 18),
        child: Text(
          title,
          style: kHeadline4,
        ),
      ),
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
