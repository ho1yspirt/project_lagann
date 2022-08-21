import 'package:flutter/material.dart';
import '../../widgets/home_widgets/home_post_item.dart';

class HomeAllScreen extends StatefulWidget {
  const HomeAllScreen({Key? key}) : super(key: key);

  @override
  State<HomeAllScreen> createState() => _HomeAllScreenState();
}

class _HomeAllScreenState extends State<HomeAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            // itemCount: 0,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const HomePostItem();
            },
          ),
        ],
      ),
    );
  }
}