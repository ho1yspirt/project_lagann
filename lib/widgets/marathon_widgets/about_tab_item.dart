import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/constants.dart';

class AboutTabItem extends StatefulWidget {
  final int index;
  const AboutTabItem(this.index, {Key? key}) : super(key: key);

  @override
  State<AboutTabItem> createState() => _AboutTabItemState();
}

class _AboutTabItemState extends State<AboutTabItem> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: kSurfaceColor,
                  shape: BoxShape.circle,
                ),
                child: const Text("1"),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Stages ${widget.index + 1}",
                style: kSubtitle1.copyWith(color: kWhiteColor),
              ),
              const Spacer(),
              InkWell(
                onTap: () => setState(() {
                  _isVisible = !_isVisible;
                }),
                child: _isVisible
                    ? const Icon(Ionicons.chevron_up)
                    : const Icon(Ionicons.chevron_down),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Visibility(
              visible: _isVisible,
              child: Text(
                "The 3D path of the samurai begins with the first step and will always be difficult. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.",
                style: kBody2TS.copyWith(
                    color: kWhiteColor, textBaseline: TextBaseline.alphabetic),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
