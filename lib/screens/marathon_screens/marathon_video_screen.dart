import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import '../../widgets/home_widgets/home_post_item.dart';
import '../notification_screens/notifications_screen.dart';
import '../search_screens/search_screen.dart';

class MarathonVideoScreen extends StatefulWidget {
  const MarathonVideoScreen({Key? key}) : super(key: key);

  @override
  State<MarathonVideoScreen> createState() => _MarathonVideoScreenState();
}

class _MarathonVideoScreenState extends State<MarathonVideoScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;

  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward(from: 0.3);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    _pageController.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView.builder(
            // itemCount: 0,
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return HomePostItem(
                true,
                animationController: animationController,
                animation: animation,
              );
            },
          ),
          // AppBar
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: SafeArea(
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Ionicons.arrow_back),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    ),
                    child: const Icon(Ionicons.search),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    ),
                    child: const Icon(Ionicons.notifications),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
