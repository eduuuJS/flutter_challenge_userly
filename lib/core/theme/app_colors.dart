import 'package:flutter/material.dart';

class AppColors {
  //Light Mode
  static const Color kBackground = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color kPrimary = Color.fromRGBO(102, 45, 145, 1.0);

  static const Color kContainer = Color.fromRGBO(245, 242, 234, 1.0);
  static const Color kContainerMedium = Color.fromRGBO(253, 251, 247, 1.0);
  static const Color kContainerLigth = Color.fromRGBO(240, 238, 235, 1.0);

  //Color.fromRGBO(1, 104, 97, 1.0);
  static const Color kGreen = Color.fromRGBO(0, 112, 74, 1.0);
  static const Color kGreentLigth = Color.fromRGBO(223, 245, 221, 1.0);

  static const Color kYellow = Color.fromRGBO(253, 173, 6, 1.0);
  static const Color kYellowMedium = Color.fromRGBO(255, 209, 113, 1.0);
  static const Color kYellowtLigth = Color.fromRGBO(245, 243, 221, 1.0);

  static const Color kText = Color.fromRGBO(0, 26, 24, 1.0);
  static const Color kTextMedium = Color.fromRGBO(81, 81, 81, 1.0);
  static const Color kTextSmall = Color.fromRGBO(130, 130, 130, 1.0);
  static const Color kTextLigth = Color.fromRGBO(170, 170, 170, 1.0);

  static const Color kBlueLigth = Color.fromRGBO(245, 249, 249, 1.0);

  static const Color kBottonNavigation = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color kSecondary = Color.fromRGBO(2, 3, 5, 1.0);
  static const Color kPurple = Color.fromRGBO(153, 0, 255, 1.0);
  static const Color kLetter = Color.fromRGBO(82, 82, 82, 1.0);
  static const Color kSubLetter = Color.fromRGBO(147, 147, 178, 1.0);
  static const Color kDisabled = Color.fromRGBO(147, 147, 178, 1.0);
  static const Color kDefault = Color.fromRGBO(247, 248, 253, 1.0);
  static const Color kDefaultGradient = Color.fromRGBO(244, 244, 245, 1.0);
  static const Color kDefaultGradient2 = Color.fromRGBO(244, 244, 245, 1.0);
  static const Color kDefaultGradient3 = Color.fromRGBO(227, 210, 243, 1.0);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color.fromRGBO(244, 244, 245, 1.0),
      Color.fromRGBO(253, 206, 222, 1.0),
      Color.fromRGBO(227, 210, 243, 1.0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
