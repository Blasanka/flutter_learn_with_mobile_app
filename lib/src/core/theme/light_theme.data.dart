import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srp_parent_mobile/src/core/constants/app_colors.dart';

class LightTheme {
  LightTheme._();

  static get getTheme => ThemeData(
    cursorColor: AppColors.primaryColor,
    textSelectionColor: AppColors.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColorDark,
    indicatorColor: AppColors.primaryColor,
    accentColor: AppColors.primaryColor,
    buttonColor: AppColors.primaryColor,
    iconTheme: IconThemeData(color: Colors.black),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColorDark,
      iconTheme: IconThemeData(
        color: AppColors.appBarIconColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      unselectedItemColor: AppColors.inactiveColorLight,
      selectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 15,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.kDarkGrey,
        fontSize: 15,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.foreGroundColor
    ),
  );
}