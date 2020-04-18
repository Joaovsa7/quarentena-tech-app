import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

final Color mainColor = hexToColor('#F25A70');
final Color secondaryColor = hexToColor('#c7041f');
final Color darkModeBackground = hexToColor('#0f0f0f');

final Map<String, ThemeData> themes = {
  'default': ThemeData(
    accentColor: Colors.white,
    primaryColorDark: mainColor,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: mainColor,
    toggleableActiveColor: mainColor,
    indicatorColor: secondaryColor,
    iconTheme: IconThemeData(
      color: mainColor,
    ),
    textTheme: TextTheme(
      body1: TextStyle(color: mainColor),
      headline: TextStyle(
        fontSize: 12,
        height: 1.5,
        color: Colors.black,
      ),
      subtitle: TextStyle(
        height: 1.5,
        color: Colors.black,
        fontSize: 12,
      ),
    ),
    buttonColor: mainColor,
    fontFamily: 'PressStart2P',
  ),
  'dark': ThemeData(
    accentColor: mainColor,
    primaryColorDark: darkModeBackground,
    backgroundColor: mainColor,
    scaffoldBackgroundColor: darkModeBackground,
    primaryColor: mainColor,
    toggleableActiveColor: mainColor,
    indicatorColor: secondaryColor,
    iconTheme: IconThemeData(
      color: mainColor,
    ),
    textTheme: TextTheme(
      body1: TextStyle(color: mainColor),
      headline: TextStyle(
        fontSize: 12,
        height: 1.5,
        color: Colors.white,
      ),
      subtitle: TextStyle(
        height: 1.5,
        color: Colors.white,
      ),
    ),
    buttonColor: darkModeBackground,
    fontFamily: 'PressStart2P',
  ),
};
