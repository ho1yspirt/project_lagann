import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_lagann/screens/home_screen.dart';
import 'package:project_lagann/screens/search_screen.dart';
// localization
import 'package:project_lagann/utils/constants.dart';
import 'package:project_lagann/utils/theme.dart';
import '../generated/l10n.dart';
import 'followed_screens.dart';
import 'marathons_screen.dart';
import 'notifications_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentBottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: pages[_currentBottomNavBarIndex],
        bottomNavigationBar: SizedBox(
          height: 64,
          child: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentBottomNavBarIndex,
            onTap: (int newIndex) {
              setState(() {
                _currentBottomNavBarIndex = newIndex;
              });
            },
            // TODO: create proper theme for botnavbar item
            items: [
              BottomNavigationBarItem(
                  activeIcon: const GradientIcon(
                      icon: Ionicons.home,
                      size: 27,
                      gradient: kPrimaryGradient),
                  icon: const Icon(Ionicons.home_outline, size: 28),
                  label: S.of(context).bottom_navbar_home),
              BottomNavigationBarItem(
                  activeIcon: const GradientIcon(
                      icon: Ionicons.play_circle,
                      size: 27,
                      gradient: kPrimaryGradient),
                  icon: const Icon(Ionicons.play_circle_outline, size: 28),
                  label: S.of(context).bottom_navbar_pro_video),
              BottomNavigationBarItem(
                  activeIcon: const GradientIcon(
                      icon: Ionicons.book,
                      size: 28,
                      gradient: kPrimaryGradient),
                  icon: const Icon(Ionicons.book_outline, size: 28),
                  label: S.of(context).bottom_navbar_courses),
              BottomNavigationBarItem(
                  activeIcon: const GradientIcon(
                      icon: Ionicons.trophy,
                      size: 27,
                      gradient: kPrimaryGradient),
                  icon: const Icon(Ionicons.trophy_outline, size: 28),
                  label: S.of(context).bottom_navbar_marathons),
              BottomNavigationBarItem(
                  activeIcon: const GradientIcon(
                      icon: Ionicons.person_circle,
                      size: 27,
                      gradient: kPrimaryGradient),
                  icon: const Icon(Ionicons.person_circle_outline, size: 28),
                  label: S.of(context).bottom_navbar_profile),
            ],
          ),
        ),
      ),
    );
  }
}
