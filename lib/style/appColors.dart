// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppColors extends ChangeNotifier {
  static const themeGreen = Color(0xFF46348C);
  static const themeOrange = Color(0xFFE2803B);
  static const themeBlue = Color(0xFF123257);
  static const lightBlueTheme = Color.fromARGB(255, 17, 116, 237);
  static const riverBlue = Color(0xFFEDF6F8);
  static const themeYellow = Color(0xFFFFC268);
  static const primary = themeGreen;
  
 static const headerTextColor = Color(0xFF16213C);
  // static const secondary = Color(0xFF265056);
  static const secondary = Color.fromARGB(255, 236, 223, 214);
  static const gray = Color.fromARGB(255, 170, 170, 170);
  static const green = Color.fromARGB(255, 23, 196, 101);
  static const gray4 = Color(0xFF495057);
  static const black = Color.fromARGB(255, 0, 0, 0);
  static const black1 = Color(0xFF19090A);
  static const textBlack = Color(0xFF121212);
  static const termsTextColor = Color(0xFF393737);
  static const scrollTrack = Color(0xFFDDDDDD);
  static const white = Color(0xFFFFFFFF);
  static const pureBlack = Color(0xFF000000);
  static const lightGrey = Color(0xFFCDD9E3);

  static const dropDownBorderColor = Color(0xFFC4C4C4);
  static const backgroundColor = Color.fromARGB(255, 246, 246, 246);
  static const red = Color.fromRGBO(244, 67, 54, 1);
  static const warning = Color(0xFFEAD918);
  static const purple = Color(0xFFA43FB9);

  static const yellowGray = Color(0xFF56390B);
  static const blueGray = Color(0xFF666D7F);

  static const appGradientColor = LinearGradient(colors: [
    AppColors.primary,
    AppColors.gray4,
  ]);
}
