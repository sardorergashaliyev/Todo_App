import 'package:flutter/material.dart';

abstract class Style {
  static const primaryColor = Color(0xffF5D155);
  static const blackColor = Colors.black;
  static const whtieColor = Colors.white;

  static const primaryGradient = LinearGradient(colors: [
    Color(0x90F5D155),
    Color(0xffF5D155),
  ]);

  static const enabledGradient = LinearGradient(colors: [
    Color(0x50F5D155),
    Color(0x70F5D155),
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
          decoration:
              isDone ? TextDecoration.lineThrough : TextDecoration.none);
}
