import 'package:flutter/material.dart';
import '../../widgets/home_widgets/home_post_item.dart';

class HomeAllScreen extends StatefulWidget {
  const HomeAllScreen({Key? key}) : super(key: key);

  @override
  State<HomeAllScreen> createState() => _HomeAllScreenState();
}

class _HomeAllScreenState extends State<HomeAllScreen>
    with TickerProviderStateMixin {
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
    animationController.dispose();
  }

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
              return HomePostItem(
                false,
                animationController: animationController,
                animation: animation,
              );
            },
          ),
        ],
      ),
    );
  }
}
