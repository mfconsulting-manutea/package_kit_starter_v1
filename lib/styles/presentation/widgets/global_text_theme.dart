import 'package:flutter/material.dart';

class GlobalTextTheme {
  static TextTheme textTheme(context) {
    return const TextTheme(
      // displayLarge = headline1
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),

      // displayMedium = headline2
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),

      // displaySmall = headline3
      displaySmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),

      // headlineMedium = headline4
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),

      // headlineSmall = headline5
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      // titleLarge = headline6
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      // titleMedium = subtitle1
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      // titleSmall = subtitle2
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),

      // bodyLarge = bodyText1
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      // bodyMedium = bodyText2
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),

      // bodySmall = caption
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),

      // labelLarge = button
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      // labelSmall = overline
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
