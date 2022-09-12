import 'package:flutter/material.dart';
import '../../widgets/home_widgets/home_post_item.dart';

class HomeFollowedScreen extends StatefulWidget {
  const HomeFollowedScreen({Key? key}) : super(key: key);

  @override
  State<HomeFollowedScreen> createState() => _HomeFollowedScreenState();
}

class _HomeFollowedScreenState extends State<HomeFollowedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView.builder(
            // itemCount: 0,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const HomePostItem(false);
            },
          ),
        ],
      ),
    );
  }
}
