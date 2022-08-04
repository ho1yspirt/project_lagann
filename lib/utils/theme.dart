import 'package:flutter/material.dart';
import './constants.dart';

// TODO: create project theme (DESIGNERS MUST DIE)

ThemeData kBasicTheme() => ThemeData(
      // colors
      // brightness: Brightness.dark,
      // primarySwatch: Colors.deepPurple,
      // primaryColor: kPrimaryColor,
      // backgroundColor: kBackgroundColor,
      scaffoldBackgroundColor: kBackgroundColor,

      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: kPrimaryColor,
          onPrimary: kWhiteColor,
          secondary: kPrimaryColor,
          onSecondary: kWhiteColor,
          error: kErrorColor,
          onError: kWhiteColor,
          background: kBackgroundColor,
          onBackground: kWhiteColor,
          surface: kSurfaceColor,
          onSurface: kWhiteColor),
      // app bar
      appBarTheme: const AppBarTheme(
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      // backdrop

      // banner

      // bottom nvabar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kSurfaceColor,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
      ),
      // buttons
      // fab
      // card
      // chips
      // dialog
      // divider
      // menu
      // drawer
      // progress indicator
      // selection control
      // sheet
      // slider
      // snackbar
      // tab
      // text field
      inputDecorationTheme: InputDecorationTheme(),
      // tooltip
    );

class GradientIcon extends StatelessWidget {
  const GradientIcon({
    Key? key,
    required this.icon,
    required this.size,
    required this.gradient,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}

// class GradientText extends StatelessWidget {
//   const GradientText(
//     this.text, {
//     required this.gradient,
//     this.style,
//   });

//   final String text;
//   final TextStyle? style;
//   final Gradient gradient;

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       blendMode: BlendMode.srcIn,
//       shaderCallback: (bounds) => gradient.createShader(
//         Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//       ),
//       child: Text(text, style: style),
//     );
//   }
// }
