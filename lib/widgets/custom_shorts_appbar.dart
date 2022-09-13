import 'package:flutter/material.dart';

class CustomShortsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;
  final AppBar appBar;
  final Widget? otherWidget;
  const CustomShortsAppBar(
      {Key? key, required this.appBar, this.otherWidget, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [appBar, otherWidget ?? const SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
