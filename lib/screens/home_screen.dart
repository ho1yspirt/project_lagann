import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/home_all_screen.dart';
import 'package:project_lagann/screens/notifications_screen.dart';
import 'package:project_lagann/screens/search_screen.dart';
import 'package:project_lagann/utils/constants.dart';
import '../generated/l10n.dart';
import 'home_followed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final PageController _pageController = PageController(initialPage: 1);

  void setIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white.withOpacity(0.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Text(
                  S.of(context).home_screen_followed,
                  style: _currentIndex == 0 ? kSubtitle1 : kBody1TS,
                ),
                onTap: () {
                  setIndex(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeFollowedScreen(),
                    ),
                  );
                },
              ),
              kSeporatorLine,
              GestureDetector(
                child: Text(
                  S.of(context).home_screen_all,
                  style: _currentIndex == 1 ? kSubtitle1 : kBody1TS,
                ),
                onTap: () {
                  setIndex(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeAllScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Ionicons.search)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Ionicons.notifications)),
              ],
            ),
          ]),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          HomeFollowedScreen(),
          HomeAllScreen(),
        ],
      ),
    );
  }
}
