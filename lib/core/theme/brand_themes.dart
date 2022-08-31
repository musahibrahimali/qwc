import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qwc/index.dart';

class BrandThemes {
  // light theme
  static lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: BrandColors.kPrimaryColor,
      scaffoldBackgroundColor: BrandColors.colorBackground,
      colorScheme: const ColorScheme.light().copyWith(
        primary: BrandColors.kPrimaryColor,
        secondary: BrandColors.colorBlue,
        error: BrandColors.kErrorColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme.apply(bodyColor: BrandColors.kContentColorLightTheme),
      ),
      hintColor: BrandColors.colorLightGreen,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: BrandColors.colorDimText,
      ),
    );
  }

  // dark theme
  static darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: BrandColors.kPrimaryColor,
      scaffoldBackgroundColor: BrandColors.colorDarkTheme,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: BrandColors.kPrimaryColor,
        error: BrandColors.kErrorColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: BrandColors.kContentColorDarkTheme,
            ),
      ),
      hintColor: BrandColors.colorWhiteAccent,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: BrandColors.colorLightGrayFair,
      ),
    );
  }
}
