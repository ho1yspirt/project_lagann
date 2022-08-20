import 'package:flutter/material.dart';
import 'package:project_lagann/utils/constants.dart';

class CustomHomeButton extends StatefulWidget {
  const CustomHomeButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  final Icon icon;
  final String title;

  @override
  State<CustomHomeButton> createState() => _CustomHomeButtonState();
}

class _CustomHomeButtonState extends State<CustomHomeButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(iconSize: kIconSize5, onPressed: () {}, icon: widget.icon),
        Text(widget.title, style: kCaptionsTS),
        const SizedBox(height: 8),
      ],
    );
  }
}
