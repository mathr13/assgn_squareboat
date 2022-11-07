import 'package:assgn_news_squareboat/constants/colours.dart';
import 'package:flutter/material.dart';

abstract class SBTextStyles {

  static const titleLight1 = TextStyle(
    fontSize: 22,
    color: SBColours.primaryTextLight,
    fontWeight: FontWeight.w600
  );
  static const titleLight2 = TextStyle(
    fontSize: 12,
    color: SBColours.primaryTextLight,
  );
  static const titleLight3 = TextStyle(
    fontSize: 16,
    color: Colors.white70,
  );

  static const titleDark1 = TextStyle(
    fontSize: 22,
    color: SBColours.primaryTextDark,
    fontWeight: FontWeight.w600
  );
  static const titleDark2 = TextStyle(
    fontSize: 16,
    color: SBColours.primaryTextDark,
    fontWeight: FontWeight.w600
  );
  static const titleDark3 = TextStyle(
    fontSize: 12,
    color: SBColours.primaryTextDark,
    fontWeight: FontWeight.w600
  );

  // static const secondaryTextStyle = TextStyle(
  //   fontSize: 16,
  //   color: SBColours.primaryTextLight,
  //   fontWeight: FontWeight.w500
  // );

  // static const tertiaryTextStyle = TextStyle(
  //   fontSize: 12,
  //   color: Color(0xff7F8A9F)
  // );

  static const headline1 = TextStyle(
    fontSize: 22,
    color: SBColours.primaryBckgDark,
    fontWeight: FontWeight.w600
  );

  static const content1 = TextStyle(
    fontSize: 20,
    color: SBColours.primaryBckgDark,
    fontWeight: FontWeight.w600
  );
  static const content2 = TextStyle(
    fontSize: 16,
    color: SBColours.primaryBckgDark,
  );
  static const content3 = TextStyle(
    fontSize: 14,
    color: SBColours.primaryBckgDark,
    fontWeight: FontWeight.w600
  );
  static const content4 = TextStyle(
    fontSize: 14,
    color: Color(0xff7F8A9F),
    fontWeight: FontWeight.w600
  );

  static const appTitle = TextStyle(
    fontSize: 40,
    color: SBColours.primaryTextLight,
    fontWeight: FontWeight.w700
  );

  static const pageIndex = TextStyle(
    fontSize: 14,
    color: SBColours.primaryTextDark,
    fontWeight: FontWeight.w700
  );

}