import 'package:flutter/material.dart';
import '../../widgets/home_widgets/home_post_item.dart';

class MarathonVideoScreen extends StatefulWidget {
  const MarathonVideoScreen({Key? key}) : super(key: key);

  @override
  State<MarathonVideoScreen> createState() => _MarathonVideoScreenState();
}

class _MarathonVideoScreenState extends State<MarathonVideoScreen> {
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
              return const HomePostItem(true);
            },
          ),
        ],
      ),
    );
  }
}
