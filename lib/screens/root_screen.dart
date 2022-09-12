import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
// localization
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/utils/theme.dart';
import '../generated/l10n.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentBottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: pages[_currentBottomNavBarIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 3.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentBottomNavBarIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentBottomNavBarIndex = newIndex;
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
                  icon: Ionicons.trophy,
                  size: kIconSize6,
                  gradient: kPrimaryGradient),
              icon: const Icon(Ionicons.trophy_outline, size: kIconSize6),
              label: S.of(context).navbar_marathons),
          BottomNavigationBarItem(
              activeIcon: const GradientIcon(
                  icon: Ionicons.book,
                  size: kIconSize6,
                  gradient: kPrimaryGradient),
              icon: const Icon(Ionicons.book_outline, size: kIconSize6),
              label: S.of(context).navbar_courses),
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
