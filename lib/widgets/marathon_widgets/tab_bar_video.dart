import 'package:flutter/material.dart';
import 'package:project_lagann/widgets/marathon_widgets/video_tab_item.dart';

class TabBarVideo extends StatefulWidget {
  const TabBarVideo({Key? key}) : super(key: key);

  @override
  State<TabBarVideo> createState() => _TabBarVideoState();
}

class _TabBarVideoState extends State<TabBarVideo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate([
          ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return VideoTabItem(index);
            },
          ),
        ]),
      ),
    ]);
  }
}
