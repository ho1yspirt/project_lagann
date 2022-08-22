import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final AppBar appBar;
  final Widget otherWidget;
  const CustomHomeAppBar(
      {Key? key,
      required this.appBar,
      required this.otherWidget,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [appBar, otherWidget],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
