import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/utils/constants.dart';

class ProVideoHomeScreen extends StatefulWidget {
  const ProVideoHomeScreen({Key? key}) : super(key: key);

  @override
  State<ProVideoHomeScreen> createState() => _ProVideoHomeScreenState();
}

class _ProVideoHomeScreenState extends State<ProVideoHomeScreen> {
  List<String> chapters = ["Trending", "All", "Subscription", "Watched"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: const Text("PROvideo"),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: const Icon(
                Ionicons.search,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(
                Ionicons.notifications,
                size: 20,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 42,
              margin: const EdgeInsets.only(bottom: 15),
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kChapterDefaultColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    margin: kChapterPadding,
                    width: 90,
                    height: 32,
                    child: const Text("Trending", style: kChapterDefaultTS),
                  ),
                  Container(
                      height: 27,
                      padding: const EdgeInsets.only(bottom: 3),
                      alignment: Alignment.bottomCenter,
                      child: kSeporatorLinePro),
                  Container(
                    decoration: BoxDecoration(
                      color: kChapterActiveColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    margin: kChapterPadding,
                    width: 44,
                    height: 32,
                    child: const Text("All", style: kChapterActiveTS),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kChapterDefaultColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    margin: kChapterPadding,
                    width: 120,
                    height: 32,
                    child: const Text("Subscription", style: kChapterDefaultTS),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kChapterDefaultColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    margin: kChapterPadding,
                    width: 90,
                    height: 32,
                    child: const Text("Watched", style: kChapterDefaultTS),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
