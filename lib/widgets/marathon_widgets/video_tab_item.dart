import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/marathon_screens/marathon_video_screen.dart';

import '../../utils/constants.dart';

class VideoTabItem extends StatefulWidget {
  final int index;
  const VideoTabItem(this.index, {Key? key}) : super(key: key);

  @override
  State<VideoTabItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoTabItem> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Stages ${widget.index + 1}",
                style: kSubtitle1.copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => setState(() {
                  _isVisible = !_isVisible;
                }),
                icon: _isVisible
                    ? const Icon(Ionicons.chevron_up)
                    : const Icon(Ionicons.chevron_down),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 6),
            child: Visibility(
              visible: _isVisible,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4,
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MarathonVideoScreen(),
                      ),
                    ),
                    child: Container(
                      width: 122,
                      height: 148,
                      color: kGreyColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
