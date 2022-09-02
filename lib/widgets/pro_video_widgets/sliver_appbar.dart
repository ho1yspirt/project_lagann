import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/notification_screens/notifications_screen.dart';
import '../../screens/search_screens/search_screen.dart';
import '../../utils/constants.dart';

class SlivAppBar extends StatelessWidget {
  final String title;
  final bool? isNeedGoBack;
  const SlivAppBar({Key? key, required this.title, this.isNeedGoBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      centerTitle: false,
      toolbarHeight: 48,
      titleSpacing: isNeedGoBack ?? false ? -10 : -39,
      backgroundColor: kBackgroundColor,
      title: Text(
        title,
        style: kSliverAppBarTS,
      ),
      leading: SizedBox(
        child: isNeedGoBack ?? false
            ? InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Ionicons.arrow_back),
              )
            : null,
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
