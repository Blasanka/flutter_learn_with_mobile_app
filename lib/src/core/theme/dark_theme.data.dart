import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/constants.dart';

// var darkThemeData = ThemeData(brightness: Brightness.dark);

class DarkTheme {
  DarkTheme._();

  static get getTheme => ThemeData(
      primaryColor: kLightGrey,
      scaffoldBackgroundColor: kDarkGrey,
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
      colorScheme: ColorScheme.dark(primary: Color(0xFF3B3E44)));
}
