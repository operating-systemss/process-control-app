import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    _instance ??= _instance = ColorSchemeLight._init();
    return _instance!;
  }

  ColorSchemeLight._init();
  final Color yellow = Color(0xffF3B823);
  final Color textGrey = Color(0xff242A37);

  final Color darkGrey = Color(0xff49493D);
  final Color lightGrey = Color(0xff959595);
  final Color lightGreySecond = Color(0xffBDBDBD);
  final Color lightGreyThird = Color(0xffBDBDBD);
  final Color red = Color(0xffFF3838);
  final Color greyBackground = Color(0xffF5F6FA);
}
