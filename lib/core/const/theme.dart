import 'dart:ui';

import 'package:flutter/material.dart';

import 'color.dart';

class MyFont {
  MyFont._();

  static const primary = 'RobotoCondensed';
  static const secondary = 'RobotoCondensed';
  static const handwriting = 'ShantellSans';
}

class MyTheme {
  MyTheme._();

  static ThemeData get({bool dark = false}) => ThemeData(
      useMaterial3: true,
      fontFamily: MyFont.primary,
      colorScheme: ColorScheme.fromSeed(
          seedColor: MyColor.seedColor,
          primary: MyColor.seedColor,
          secondary: MyColor.secondaryColor,
          tertiary: MyColor.tertiaryColor,
          brightness: dark ? Brightness.dark : Brightness.light),
      textTheme: _textTheme,
      iconTheme: _iconTheme,
      navigationDrawerTheme: _navigationDrawerTheme,
      chipTheme: _chipTheme,
      appBarTheme: _appbarTheme,
      extensions: [MyColor.customColors(dark)]);

  static get _textTheme => const TextTheme(
      displayLarge: TextStyle(
          fontSize: 57, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.12),
      displayMedium: TextStyle(
          fontSize: 45, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.15),
      displaySmall:
          TextStyle(fontSize: 36, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.2),
      headlineLarge: TextStyle(
          fontSize: 32, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.25),
      headlineMedium: TextStyle(
          fontSize: 28, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.29),
      headlineSmall: TextStyle(
          fontSize: 24, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.33),
      titleLarge: TextStyle(
          fontSize: 22, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.27),
      titleMedium:
          TextStyle(fontSize: 16, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.5),
      titleSmall: TextStyle(
          fontSize: 14, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.43),
      bodyLarge: TextStyle(
          fontSize: 16,
          fontFamily: MyFont.secondary,
          fontVariations: [FontVariation.weight(400)],
          height: 1.5,
          letterSpacing: 0),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontFamily: MyFont.secondary,
          fontVariations: [FontVariation.weight(400)],
          height: 1.43,
          letterSpacing: 0),
      bodySmall: TextStyle(
          fontSize: 12,
          fontFamily: MyFont.secondary,
          fontVariations: [FontVariation.weight(400)],
          height: 1.33,
          letterSpacing: 0),
      labelLarge: TextStyle(
          fontSize: 14,
          fontFamily: MyFont.secondary,
          fontVariations: [FontVariation.weight(500)],
          height: 1.43,
          letterSpacing: 0),
      labelMedium: TextStyle(
          fontSize: 12,
          fontFamily: MyFont.secondary,
          fontVariations: [FontVariation.weight(500)],
          height: 1.33,
          letterSpacing: 0),
      labelSmall: TextStyle(
          fontSize: 11,
          fontFamily: MyFont.secondary,
          fontVariations: [FontVariation.weight(550)],
          height: 1.45,
          letterSpacing: 0));

  static get _iconTheme => const IconThemeData(fill: 0, weight: 400, opticalSize: 24);

  static get _navigationDrawerTheme => const NavigationDrawerThemeData(tileHeight: 48);

  static get _chipTheme => const ChipThemeData(padding: EdgeInsets.symmetric(horizontal: 4));

  static get _appbarTheme => const AppBarTheme(titleSpacing: 0);
}
