import 'package:flutter/material.dart';
import 'package:project_lagann/screens/followed_screens.dart';
import 'package:project_lagann/screens/home_screen.dart';
import 'package:project_lagann/screens/marathons_screen.dart';

// pages
const pages = [
  HomeScreen(),
  Text('Pro Video'),
  Text('Courses'),
  Text('Categories'),
  Text('Profile'),
];
const appBarPages = [
  HomeScreen(),
  FollowedScreen(),
  MarathonsScreen(),
];
// text style

// fonts

// colors
const Color kPrimaryColor = Color(0xFF8060FF);
// const Color kSecondaryColor = Color();
const Color kBackgroundColor = Color(0xFF242A38);
const Color kSurfaceColor = Color(0xFF1C202B);
const Color kSurfaceColorWithOpacity = Color(0xFF4E596F);
const Color kWhiteColor = Color(0xFFF2F2F2);
const Color kGreyColor = Color(0xFFD2D2D2);
const Color kErrorColor = Color(0xFFB00020);

const Gradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF4518F4),
    Color(0xFF8162FF),
  ],
);

Container kSeporatorLine = Container(
  height: 20,
  width: 2,
  margin: const EdgeInsets.only(left: 8, right: 8),
  decoration:
      BoxDecoration(color: kGreyColor, borderRadius: BorderRadius.circular(10)),
);

Container kSeporatorDot = Container(
  height: 4,
  width: 4,
  margin: const EdgeInsets.only(left: 8, right: 8),
  decoration: const BoxDecoration(color: kGreyColor, shape: BoxShape.circle),
);
