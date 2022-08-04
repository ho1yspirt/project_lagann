import 'package:flutter/material.dart';
import 'package:project_lagann/proVideoScreens/proVideo_home_screen.dart';
import 'package:project_lagann/screens/followed_screens.dart';
import 'package:project_lagann/screens/home_screen.dart';
import 'package:project_lagann/screens/marathons_screen.dart';

// pages
const pages = [
  HomeScreen(),
  ProVideoHomeScreen(),
  Text('Courses'),
  Text('Categories'),
  Text('Profile'),
];

// project global colors
const Color kPrimaryColor = Color(0xFF8060FF);
const Color kBackgroundColor = Color(0xFF242A38);
const Color kSurfaceColor = Color(0xFF1C202B);
const Color kSurfaceColorWithOpacity = Color(0xFF4E596F);
const Color kWhiteColor = Color(0xFFF2F2F2);
const Color kGreyColor = Color(0xFFD2D2D2);
const Color kErrorColor = Color(0xFFB00020);

// prject global gradient
const Gradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF4518F4),
    Color(0xFF8162FF),
  ],
);

// project global text style
const TextStyle kCaptionsTS = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 0.4,
);
const TextStyle kButtonTS = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  letterSpacing: 1.25,
);
const TextStyle kBody2TS = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 0.25,
);
const TextStyle kSubtitle2 = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  letterSpacing: 0.25,
);
const TextStyle kSubtitle1 = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  letterSpacing: 0.5,
);
const TextStyle kBody1TS = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: 0.5,
);
// Designer's h1, h2, h3 are h4, h5, h6 here
const TextStyle kHeadline6 = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14,
  letterSpacing: 0.1,
);
const TextStyle kHeadline5 = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 16,
  letterSpacing: 0.15,
);
const TextStyle kHeadline4 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 20,
  letterSpacing: 0.15,
);
// project global icons size
const int iconSize8 = 20;
const int iconSize7 = 24;
const int iconSize6 = 28;
const int iconSize5 = 32;
const int iconSize4 = 36;
const int iconSize3 = 44;
const int iconSize2 = 60;
const int iconSize1 = 80;

// pro video constants
//pro video padding
const EdgeInsetsGeometry kChapterPadding =
    EdgeInsets.only(left: 10, top: 10, right: 10);

//project global content seporators
//vertical line
Container kSeporatorLine = Container(
  height: 28,
  width: 2,
  margin: const EdgeInsets.only(left: 8, right: 8),
  decoration:
      BoxDecoration(color: kGreyColor, borderRadius: BorderRadius.circular(10)),
);
// round dot
Container kSeporatorDot = Container(
  height: 4,
  width: 4,
  margin: const EdgeInsets.only(left: 8, right: 8),
  decoration: const BoxDecoration(color: kGreyColor, shape: BoxShape.circle),
);
