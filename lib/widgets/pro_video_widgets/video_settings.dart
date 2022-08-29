import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/controllers/video_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../utils/constants.dart';

class VideoSettings extends StatefulWidget {
  const VideoSettings(this.videoPlayerController, {Key? key}) : super(key: key);

  final VideoPlayerController videoPlayerController;

  @override
  State<VideoSettings> createState() => _VideoSettingsState();
}

class _VideoSettingsState extends State<VideoSettings> {
  List<DropdownMenuItem<String>> settingItems = [
    const DropdownMenuItem(value: "2.0", child: Text("2.0x")),
    const DropdownMenuItem(value: "1.75", child: Text("1.75x")),
    const DropdownMenuItem(value: "1.5", child: Text("1.5x")),
    const DropdownMenuItem(value: "1.25", child: Text("1.25x")),
    const DropdownMenuItem(value: "1.0", child: Text("Normal")),
    const DropdownMenuItem(value: "0.75", child: Text("0.75x")),
    const DropdownMenuItem(value: "0.5", child: Text("0.5x")),
    const DropdownMenuItem(value: "0.25", child: Text("0.25x")),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Icon(
                Ionicons.timer_outline,
                size: 30,
              ),
            ),
            const Text(
              "Video speed",
              style: kVideoTitleTS,
            ),
            //const Padding(
            //   padding: EdgeInsets.only(left: 50),
            //   child: Text(
            //     "Normal",
            //     style: kVideoTitleTS,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor: kBackgroundColor,
                  enableFeedback: true,
                  icon: const Icon(
                    Ionicons.chevron_down,
                    color: kWhiteColor,
                  ),
                  style: kVideoTitleTS,
                  items: settingItems,
                  value: context.watch<VideoController>().currentSpeed,
                  onChanged: (String? newSpeed) {
                    context.read<VideoController>().setVideoSpeed(newSpeed!);
                    setState(() {
                      widget.videoPlayerController
                          .setPlaybackSpeed(double.parse(newSpeed));
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 15,
        left: 0,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Icon(
                Ionicons.help,
                size: 30,
              ),
            ),
            Text(
              "Help and feedback",
              style: kVideoTitleTS,
            ),
          ],
        ),
      ),
    ]);
  }
}
