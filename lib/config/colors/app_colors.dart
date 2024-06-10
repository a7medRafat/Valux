import 'package:flutter/material.dart';

class AppColors {
  // static Color scaffoldColor = const Color(0xffececec);
  static Color scaffoldColor = const Color(0xfff6f6f6);
  static Color primaryColor =  Colors.black;
  static Color vBlue =  Colors.blue;
  static Color iconColor = Colors.black;
  static Color titles = Colors.black;
  static Color body = Colors.black;
  static Color offColor = Colors.black;
  static Color vGray = Colors.grey;
  static Color vWhite = Colors.white;
  static Color vRed = Colors.redAccent;
  static Color bodySmall = const Color(0xff848484);
  static Color vBottomNavColor = Colors.white;
  static Color confirmation = Colors.green.withOpacity(0.5);

  Shader instaGradient = const LinearGradient(
          colors: [Color(0xffF9CE34), Color(0xffee2a7b), Color(0xff6228d7)])
      .createShader(const Rect.fromLTWH(0.0, 0.0, 200, 70.0));
}
