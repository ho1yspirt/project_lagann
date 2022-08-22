import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';

class CustomHomeButton extends StatefulWidget {
  final Icon icon;
  final Icon activatedIcon;
  final String title;
  final bool isChangeble;
  const CustomHomeButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.isChangeble,
    required this.activatedIcon,
  }) : super(key: key);
  @override
  State<CustomHomeButton> createState() => _CustomHomeButtonState();
}

class _CustomHomeButtonState extends State<CustomHomeButton> {
  bool _isActivated = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            iconSize: kIconSize5,
            onPressed: () {
              setState(() {
                _isActivated = !_isActivated;
              });
            },
            icon: widget.isChangeble
                ? (_isActivated ? widget.activatedIcon : widget.icon)
                : widget.icon),
        Text(widget.title, style: kCaptionsTS),
        const SizedBox(height: 8),
      ],
    );
  }
}
