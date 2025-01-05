import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  //reference colors
  static const Color _pinkish = Color(0XFFf2e8eb);
  static const Color _red = Color(0xFF964f66);
  static const Color _green = Color(0xFF00F318);
  static const Color _black = Colors.black;

  //actual colors to be used throughout the app
  final Color bgColor;
  final Color bgInput;
  final Color snackbarValidation;
  final Color snackBarFailure;
  final Color textDefault;

  // private constructor (use factories below instead):
  const AppColorsTheme._internal({
    required this.bgColor,
    required this.bgInput,
    required this.snackbarValidation,
    required this.snackBarFailure,
    required this.textDefault,
  });

//defining light theme
  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
        bgColor: _pinkish,
        bgInput: _red,
        snackbarValidation: _green,
        snackBarFailure: _red,
        textDefault: _black);
  }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode == true) {
      return AppColorsTheme.light();
    }
    return AppColorsTheme.light();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
          covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}
