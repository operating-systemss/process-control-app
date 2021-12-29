import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      primaryColor: colorSchemeLight.yellow,
      fontFamily: ApplicationConstants.FONT_FAMILY_REGULAR,
      // ignore: deprecated_member_use
      accentColor: colorSchemeLight.darkGrey,
      iconTheme: IconThemeData(
        color: colorSchemeLight.yellow,
      ),
      textTheme: textTheme,
      primaryTextTheme: TextTheme(
          headline6: textThemeLight!.headline1.copyWith(
        fontSize: 30,
        fontFamily: ApplicationConstants.FONT_FAMILY_MEDIUM,
        color: colorSchemeLight.textGrey,
      )),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorSchemeLight.darkGrey,
      ),
      backgroundColor: Colors.white,
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: textThemeLight!.headline2,
          centerTitle: false,
          iconTheme: IconThemeData(color: colorSchemeLight.darkGrey, size: 21)),
      inputDecorationTheme: inputDecorationTheme(),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: ThemeData.light()
          .floatingActionButtonTheme
          .copyWith(
              backgroundColor: colorSchemeLight.yellow,
              elevation: 5,
              splashColor: colorSchemeLight.darkGrey),
      buttonTheme: ThemeData.light().buttonTheme.copyWith(
            colorScheme: ColorScheme.light(
              onError: colorSchemeLight.red,
            ),
          ),
      tabBarTheme: tabBarTheme,
      colorScheme: _appColorScheme);

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorSchemeLight.greyBackground,
      hintStyle: textThemeLight!.body2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: colorSchemeLight.red),
          gapPadding: 0),
    );
  }

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.surface,
      unselectedLabelColor: _appColorScheme.surface.withOpacity(0.8),
    );
  }

  TextTheme get textTheme {
    return ThemeData.light().textTheme.copyWith(
        headline1: textThemeLight!.headline1,
        headline2: textThemeLight!.headline2,
        headline3: textThemeLight!.headline3,
        bodyText1: textThemeLight!.body1,
        bodyText2: textThemeLight!.body2,
        subtitle1: textThemeLight!.textFormFieldTextStyle);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight.yellow,
        primaryVariant: colorSchemeLight.darkGrey,
        secondary: colorSchemeLight.lightGrey,
        secondaryVariant: colorSchemeLight.lightGreySecond,
        surface: colorSchemeLight.lightGreyThird,
        onPrimary: colorSchemeLight.red,
        onSecondary: colorSchemeLight.red, //xx
        onSurface: Colors.white, //xx
        onBackground: Colors.white, //xx
        onError: Color(0xFFF91616), //xx
        background: Color(0xffFBF6F4), //xx
        error: colorSchemeLight.red, //xx
        brightness: Brightness.light);
  }
}
