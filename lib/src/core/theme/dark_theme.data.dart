import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/constants/app_colors.dart';
import 'package:srp_parent_mobile/src/core/constants/constants.dart';

class DarkTheme {
  DarkTheme._();

  static get getTheme => ThemeData(
      primaryColor: AppColors.kLightGrey,
      primaryColorDark: AppColors.kLightGrey,
      scaffoldBackgroundColor: AppColors.kDarkGrey,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontFamily: kGemunuLibreFont),
        bodyText1: TextStyle(
            color: Colors.white, fontFamily: kGemunuLibreFont, fontSize: 14.0),
        bodyText2: TextStyle(
            color: Color(0xFF959596),
            fontFamily: kGemunuLibreFont,
            fontSize: 14.0),
        headline1: TextStyle(color: Colors.white, fontFamily: kGemunuLibreFont),
        headline2: TextStyle(color: Colors.white, fontFamily: kGemunuLibreFont),
        headline4: TextStyle(
            color: Colors.white, fontFamily: kGemunuLibreFont, fontSize: 24.0),
        headline5: TextStyle(
            color: Colors.white, fontFamily: kGemunuLibreFont, fontSize: 18.0),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.kLightGrey,
        iconTheme: IconThemeData(
          color: AppColors.appBarIconColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        unselectedItemColor: AppColors.inactiveColorDark,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 15,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.inactiveColorDark,
          fontSize: 15,
        ),
      ),
      colorScheme: ColorScheme.dark(primary: Color(0xFF3B3E44)));
}
