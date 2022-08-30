import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/home_screens/home_all_screen.dart';
import 'package:project_lagann/screens/notification_screens/notifications_screen.dart';
import 'package:project_lagann/screens/search_screens/search_screen.dart';
import 'package:project_lagann/utils/constants.dart';
import '../../generated/l10n.dart';
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
      appBar: CustomHomeAppBar(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white.withOpacity(0.0),
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
        otherWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      kSeporatorLine,
                      Positioned(
                        left: 28,
                        child: GestureDetector(
                          child: Text(
                            S.of(context).home_screen_signed,
                            style: _currentIndex == 0 ? kSubtitle1 : kBody1TS,
                          ),
                          onTap: () {
                            _onFollowedPress();
                            setIndex(0);
                          },
                        ),
                      ),
                      Positioned(
                        right: 64,
                        child: GestureDetector(
                          child: Text(
                            S.of(context).home_screen_all,
                            style: _currentIndex == 1 ? kSubtitle1 : kBody1TS,
                          ),
                          onTap: () {
                            _onALlPress();
                            setIndex(1);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        height: AppBar().preferredSize.height,
      ),
      body: PageView(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: const [
          HomeFollowedScreen(),
          HomeAllScreen(),
        ],
      ),
    );
  }

  void _onFollowedPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onALlPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final AppBar appBar;
  final Widget otherWidget;
  const CustomHomeAppBar(
      {Key? key,
      required this.appBar,
      required this.otherWidget,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [appBar, otherWidget],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
