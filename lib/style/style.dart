import 'package:flutter/material.dart';

abstract class Style {
  static const primaryColor = Color(0xffF43F5E);
  static const blackColor = Colors.black;
  static const whtieColor = Colors.white;

  static const primaryGradient = LinearGradient(colors: [
    Color(0xffFF7E95),
    Color(0xffFF1843),
  ]);

  static const enabledGradient = LinearGradient(colors: [
    Color(0x50FF7E95),
    Color(0x50FF7E95),
  ]);
  

  static textStyle(
          {double size = 16,
          Color textColor = blackColor,
          FontWeight fontWeight = FontWeight.w600,
          bool isDone = false}) =>
      TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: fontWeight,
        decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none
      );
}
