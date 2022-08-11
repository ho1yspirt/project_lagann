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

// pro video colors
const Color kChapterDefaultColor = Color(0xFF4E596F);
const Color kChapterActiveColor = Color(0xFFF2F2F2);

// pro video text styles
const TextStyle kChapterDefaultTS = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: 0.5,
  color: Color(0xFFF2F2F2),
);
const TextStyle kChapterActiveTS = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  letterSpacing: 0.5,
  color: Color(0xFF1C202B),
);

const TextStyle kVideoInfoTS = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 0.25,
  color: Color(0xFFD2D2D2),
);

const TextStyle kVideoTitleTS = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  letterSpacing: 0.5,
  color: Color(0xFFF2F2F2),
);

const TextStyle kSliverAppBarTS = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  letterSpacing: 0.15,
  color: Color.fromARGB(255, 255, 255, 255),
);

const TextStyle kTenSecondsTS = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 0.4,
  color: kWhiteColor,
);

// pro video constants
const EdgeInsetsGeometry kChapterPadding =
    EdgeInsets.only(left: 6, top: 10, right: 6);
Container kSeporatorLinePro = Container(
  alignment: Alignment.topCenter,
  height: 27,
  width: 2,
  decoration:
      BoxDecoration(color: kGreyColor, borderRadius: BorderRadius.circular(10)),
);

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
  height: 6,
  width: 6,
  margin: const EdgeInsets.only(left: 8, right: 8),
  decoration: const BoxDecoration(color: kGreyColor, shape: BoxShape.circle),
);
