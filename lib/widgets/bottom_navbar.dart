import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../generated/l10n.dart';
import '../utils/constants.dart';
import '../utils/theme.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);
  late int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: BottomNavigationBar(
        selectedLabelStyle: kCaptionsTS,
        unselectedLabelStyle: kCaptionsTS,
        elevation: 3.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.currentIndex,
        onTap: (int newIndex) {
          setState(() {
            widget.currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: const GradientIcon(
                  icon: Ionicons.home,
                  size: kIconSize6,
                  gradient: kPrimaryGradient),
              icon: const Icon(Ionicons.home_outline, size: kIconSize6),
              label: S.of(context).navbar_home),
          BottomNavigationBarItem(
              activeIcon: const GradientIcon(
                  icon: Ionicons.play_circle,
                  size: kIconSize6,
                  gradient: kPrimaryGradient),
              icon: const Icon(Ionicons.play_circle_outline, size: kIconSize6),
              label: S.of(context).navbar_pro_video),
          BottomNavigationBarItem(
              activeIcon: const GradientIcon(
                  icon: Ionicons.book,
                  size: kIconSize6,
                  gradient: kPrimaryGradient),
              icon: const Icon(Ionicons.book_outline, size: kIconSize6),
              label: S.of(context).navbar_courses),
          BottomNavigationBarItem(
              activeIcon: const GradientIcon(
                  icon: Ionicons.trophy,
                  size: kIconSize6,
                  gradient: kPrimaryGradient),
              icon: const Icon(Ionicons.trophy_outline, size: kIconSize6),
              label: S.of(context).navbar_marathons),
          BottomNavigationBarItem(
              activeIcon: const GradientIcon(
                  icon: Ionicons.person_circle,
                  size: kIconSize6,
                  gradient: kPrimaryGradient),
              icon:
                  const Icon(Ionicons.person_circle_outline, size: kIconSize6),
              label: S.of(context).navbar_profile),
        ],
      ),
    );
  }
}
