import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle headLine() => TextStyle(
    fontSize: 23.0,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    fontFamily: "Roboto",
  );

  static TextStyle appBarText() => TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: "Roboto",
  );

  static TextStyle bodyText() => TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: "Roboto",
  );

  static TextStyle caption() => TextStyle(
    fontSize: 13.0,
    color: Colors.grey,
    fontFamily: "Roboto",
  );
  static TextStyle subTitle() => TextStyle(
    fontSize: 14.0,
    color: Colors.grey,
    height: 1.3,
    fontFamily: "Roboto",
  );
}
