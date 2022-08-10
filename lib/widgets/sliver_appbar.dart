import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/notifications_screen.dart';

import '../screens/search_screen.dart';
import '../utils/constants.dart';

class SlivAppBar extends StatelessWidget {
  const SlivAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 120,
      backgroundColor: kBackgroundColor,
      leading: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: const Padding(
          padding: EdgeInsets.only(left: 10, top: 18),
          child: Text(
            "PROvideo",
            style: kSliverAppBarTS,
          ),
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
            size: 20,
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
            size: 20,
          ),
        ),
      ],
    );
  }
}
