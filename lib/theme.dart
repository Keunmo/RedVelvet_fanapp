import 'package:flutter/material.dart';

final ThemeData RVThemeData = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: MaterialColor(RVColors.coral[50].value, RVColors.coral),
  primaryColor: MaterialColor(RVColors.coral[50].value, RVColors.coral),
  primaryColorBrightness: Brightness.light,
  accentColor: RVColors.coral[50],
  accentColorBrightness: Brightness.light,
);

class RVColors {
  RVColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> coral = const <int, Color>{
    50: const Color(0xffFFB69F),
    100: const Color(0xffffe0d6),
    200: const Color(0xffFFB69F),
    300: const Color(0xffFFB69F),
    400: const Color(0xffFFB69F),
    500: const Color(0xffFFB69F),
    600: const Color(0xffFFB69F),
    700: const Color(0xffFFB69F),
    800: const Color(0xffFFB69F),
    900: const Color(0xffFFB69F),
  };
}
