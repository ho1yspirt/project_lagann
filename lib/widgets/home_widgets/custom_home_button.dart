import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/controllers/short_video_controller.dart';
import 'package:project_lagann/utils/constants.dart';
import 'package:provider/provider.dart';
import '../../utils/theme.dart';

class CustomHomeButton extends StatefulWidget {
  final Icon icon;
  final GradientIcon activatedIcon;
  final String? title;
  final bool isChangeble;
  final bool isHeart;

  const CustomHomeButton({
    Key? key,
    required this.icon,
    this.title,
    required this.isChangeble,
    required this.activatedIcon,
    required this.isHeart,
  }) : super(key: key);
  @override
  State<CustomHomeButton> createState() => _CustomHomeButtonState();
}

class _CustomHomeButtonState extends State<CustomHomeButton> {
  bool _isStar = false;
  bool _isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: kIconSize5,
          onPressed: () {
            if (widget.icon.icon == const Icon(Ionicons.heart_outline).icon) {
              context.read<ShortVideoController>().setLike();
            } else if (widget.icon.icon ==
                const Icon(Ionicons.star_outline).icon) {
              setState(() {
                _isStar = !_isStar;
              });
            } else {
              setState(() {
                _isSaved = !_isSaved;
              });
            }
          },
          icon: widget.isChangeble
              ? (widget.icon.icon == const Icon(Ionicons.heart_outline).icon
                  ? context.watch<ShortVideoController>().isLiked
                      ? widget.activatedIcon
                      : widget.icon
                  : _isStar || _isSaved
                      ? widget.activatedIcon
                      : widget.icon)
              : widget.icon,
        ),
        if (widget.title != null) Text(widget.title!, style: kCaptionsTS),
        const SizedBox(height: 8),
      ],
    );
  }
}
