import 'package:flutter/material.dart';
import './constants.dart';

ThemeData kBasicTheme() => ThemeData(
      // colors

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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: kWhiteColor,
          textStyle: kSubtitle2,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 8,
          primary: kPrimaryColor,
          onPrimary: kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      // fab
      // card

      // chips
      chipTheme: ChipThemeData(
        backgroundColor: kSurfaceColorWithOpacity,
        selectedColor: kWhiteColor,
        disabledColor: kGreyColor,
        secondarySelectedColor: kWhiteColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        elevation: 0,
        showCheckmark: false,
        labelStyle: kBody1TS,
        secondaryLabelStyle: kSubtitle1.copyWith(color: kSurfaceColor),
      ),
      // dialog
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0.0,
        backgroundColor: kBackgroundColor,
      ),
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
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(8, 8, 0, 10),
        labelStyle: kSubtitle1.copyWith(color: kWhiteColor),
        hintStyle: kSubtitle1.copyWith(color: kGreyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kSurfaceColorWithOpacity,
      ),
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
        width: size,
        height: size,
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
