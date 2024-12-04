import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_color.dart';

ThemeData getThemeLightData() {
  return ThemeData(
      scaffoldBackgroundColor: AppColor.secondaryColor,
      primaryColor: AppColor.primaryColor,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.backgroundColor,
        ),
        displayMedium: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.backgroundColor,
        ),
        displaySmall: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16.sp,
          color: AppColor.backgroundColor.withOpacity(0.44),
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color.fromARGB(255, 236, 235, 235),
        hintStyle: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.backgroundColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.backgroundColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.backgroundColor),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColor.backgroundColor));
}

ThemeData getThemeDarkData() {
  return ThemeData(
      scaffoldBackgroundColor: AppColor.backgroundColor,
      primaryColor: AppColor.primaryColor,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.secondaryColor,
        ),
        displayMedium: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.secondaryColor,
        ),
        displaySmall: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16.sp,
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.backgroundColor,
        hintStyle: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.secondaryColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.secondaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.secondaryColor),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColor.secondaryColor));
}
