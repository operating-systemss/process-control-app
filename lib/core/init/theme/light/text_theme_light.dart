import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app/app_constants.dart';
import 'color_scheme_light.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();
  final TextStyle headline1 = TextStyle(
      fontSize: 28.sp,
      fontFamily: ApplicationConstants.FONT_FAMILY_REGULAR,
      color: ColorSchemeLight.instance.darkGrey);

  final TextStyle headline2 = TextStyle(
      fontSize: 20.sp,
      fontFamily: ApplicationConstants.FONT_FAMILY_BOLD,
      color: ColorSchemeLight.instance.darkGrey);

  final TextStyle headline3 = TextStyle(
      fontSize: 15.sp,
      fontFamily: ApplicationConstants.FONT_FAMILY_MEDIUM,
      color: ColorSchemeLight.instance.darkGrey);

  final TextStyle body1 = TextStyle(
    fontSize: 10.sp,
    color: ColorSchemeLight.instance.darkGrey,
    fontFamily: ApplicationConstants.FONT_FAMILY_BOLD,
  );
  final TextStyle body2 = TextStyle(
    fontSize: 10.sp,
    color: ColorSchemeLight.instance.darkGrey,
    fontFamily: ApplicationConstants.FONT_FAMILY_MEDIUM,
  );
  final TextStyle textFormFieldTextStyle = TextStyle(
      fontSize: 10.sp,
      color: ColorSchemeLight.instance.darkGrey,
      fontFamily: ApplicationConstants.FONT_FAMILY_BOLD);
}
