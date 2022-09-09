import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/home_widgets/home_post_item.dart';

class MarathonVideoScreen extends StatefulWidget {
  const MarathonVideoScreen({Key? key}) : super(key: key);

  @override
  State<MarathonVideoScreen> createState() => _MarathonVideoScreenState();
}

class _MarathonVideoScreenState extends State<MarathonVideoScreen> {
  late PageController _pageController;
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    void pop() {
      Navigator.of(context).pop();
    }

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
                pop: pop,
              );
            },
          ),
        ],
      ),
    );
  }
}
