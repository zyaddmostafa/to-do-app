import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_color.dart';

ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    primaryColor: AppColor.primaryColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColor.secondaryColor,
      ),
      displayMedium: TextStyle(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.secondaryColor,
      ),
      displaySmall: TextStyle(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 16,
        color: AppColor.secondaryColor.withOpacity(0.44),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

ThemeData getThemeDarkData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    primaryColor: AppColor.primaryColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColor.secondaryColor,
      ),
      displayMedium: TextStyle(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.secondaryColor,
      ),
      displaySmall: TextStyle(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 16,
        color: AppColor.secondaryColor.withOpacity(0.44),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
