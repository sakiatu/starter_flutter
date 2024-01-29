import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class MyFont {
  MyFont._();
  static const primary = 'Manrope';
  static const secondary = 'Inter';
}

class MyTheme {
  MyTheme._();
  static const seedBrand = Color(0XFF0087E4);
  static const seedWarning = Color(0xFFF29F05);
  static const seedProxy = Color(0xFFAF7BFF);

  static ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      fontFamily: MyFont.primary,
      colorScheme: ColorScheme.fromSeed(seedColor: seedBrand),
      textTheme: textTheme,
      iconTheme: iconTheme,
      inputDecorationTheme: inputDecorationTheme,
      navigationDrawerTheme: navigationDrawerTheme,
      chipTheme: chipTheme,
      appBarTheme: appbarTheme,
      extensions: const [lightCustomColors]);

  static ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      fontFamily: MyFont.primary,
      colorScheme: ColorScheme.fromSeed(seedColor: seedBrand, brightness: Brightness.dark),
      textTheme: textTheme,
      iconTheme: iconTheme,
      inputDecorationTheme: inputDecorationTheme,
      navigationDrawerTheme: navigationDrawerTheme,
      chipTheme: chipTheme,
      appBarTheme: appbarTheme,
      extensions: const [darkCustomColors]);

  static get textTheme => const TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontFamily: MyFont.primary, fontVariations:[FontVariation.weight(600)], height: 1.12),
      displayMedium: TextStyle(fontSize: 45, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.15),
      displaySmall: TextStyle(fontSize: 36, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.2),
      headlineLarge: TextStyle(fontSize: 32, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.25),
      headlineMedium: TextStyle(fontSize: 28, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.29),
      headlineSmall: TextStyle(fontSize: 24, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.33),
      titleLarge: TextStyle(fontSize: 22, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.27),
      titleMedium: TextStyle(fontSize: 16, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.5),
      titleSmall: TextStyle(fontSize: 14, fontFamily: MyFont.primary, fontVariations: [FontVariation.weight(600)], height: 1.43),
      bodyLarge: TextStyle(
          fontSize: 16, fontFamily: MyFont.secondary, fontVariations: [FontVariation.weight(400)], height: 1.5, letterSpacing: 0),
      bodyMedium: TextStyle(
          fontSize: 14, fontFamily: MyFont.secondary, fontVariations: [FontVariation.weight(400)], height: 1.43, letterSpacing: 0),
      bodySmall: TextStyle(
          fontSize: 12, fontFamily: MyFont.secondary, fontVariations: [FontVariation.weight(400)], height: 1.33, letterSpacing: 0),
      labelLarge: TextStyle(
          fontSize: 14, fontFamily: MyFont.secondary, fontVariations: [FontVariation.weight(500)], height: 1.43, letterSpacing: 0),
      labelMedium: TextStyle(
          fontSize: 12, fontFamily: MyFont.secondary, fontVariations: [FontVariation.weight(500)], height: 1.33, letterSpacing: 0),
      labelSmall: TextStyle(
          fontSize: 11, fontFamily: MyFont.secondary, fontVariations: [FontVariation.weight(550)], height: 1.45, letterSpacing: 0));

  static get iconTheme => const IconThemeData(fill: 0, weight: 400, opticalSize: 24);

  static get inputDecorationTheme => const InputDecorationTheme(border: OutlineInputBorder());

  static get navigationDrawerTheme => const NavigationDrawerThemeData(tileHeight: 48);

  static get chipTheme => const ChipThemeData(padding: EdgeInsets.symmetric(horizontal: 4));

  static get appbarTheme => const AppBarTheme(titleSpacing: 0);

  static const lightCustomColors = CustomColors(
    surfaceContainerHighest: Color(0xFFE3E2E6),
    surfaceContainerHigh: Color(0xFFE8E8EB),
    surfaceContainer: Color(0xFFEEEDF1),
    surfaceContainerLow: Color(0xFFF4F3F7),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceBright: Color(0xFFFAF9FC),
    surfaceDim: Color(0xFFDAD9DD),
    warning: Color(0xFF845400),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFFFFDDB5),
    onWarningContainer: Color(0xFF2A1800),
    proxy: Color(0xFF7540C2),
    onProxy: Color(0xFFFFFFFF),
    proxyContainer: Color(0xFFECDCFF),
    onProxyContainer: Color(0xFF280056),
  );

  static const darkCustomColors = CustomColors(
    surfaceContainerHighest: Color(0xFF333538),
    surfaceContainerHigh: Color(0xFF292A2D),
    surfaceContainer: Color(0xFF1E2022),
    surfaceContainerLow: Color(0xFF1A1C1E),
    surfaceContainerLowest: Color(0xFF0D0E11),
    surfaceBright: Color(0xFF38393C),
    surfaceDim: Color(0xFF121316),
    warning: Color(0xFFFFB958),
    onWarning: Color(0xFF462B00),
    warningContainer: Color(0xFF643F00),
    onWarningContainer: Color(0xFFFFDDB5),
    proxy: Color(0xFFD6BAFF),
    onProxy: Color(0xFF430089),
    proxyContainer: Color(0xFF5C22A8),
    onProxyContainer: Color(0xFFECDCFF),
  );
}

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.surfaceContainerHighest,
    required this.surfaceContainerHigh,
    required this.surfaceContainer,
    required this.surfaceContainerLow,
    required this.surfaceContainerLowest,
    required this.surfaceBright,
    required this.surfaceDim,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.proxy,
    required this.onProxy,
    required this.proxyContainer,
    required this.onProxyContainer,
  });

  final Color? surfaceContainerHighest;
  final Color? surfaceContainerHigh;
  final Color? surfaceContainer;
  final Color? surfaceContainerLow;
  final Color? surfaceContainerLowest;
  final Color? surfaceBright;
  final Color? surfaceDim;
  final Color? warning;
  final Color? onWarning;
  final Color? warningContainer;
  final Color? onWarningContainer;
  final Color? proxy;
  final Color? onProxy;
  final Color? proxyContainer;
  final Color? onProxyContainer;

  @override
  CustomColors copyWith({
    Color? surfaceContainerHighest,
    Color? surfaceContainerHigh,
    Color? surfaceContainer,
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    Color? surfaceBright,
    Color? surfaceDim,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? proxy,
    Color? onProxy,
    Color? proxyContainer,
    Color? onProxyContainer,
  }) {
    return CustomColors(
      surfaceContainerHighest: surfaceContainerHighest ?? this.surfaceContainerHighest,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerLowest: surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      proxy: proxy ?? this.proxy,
      onProxy: onProxy ?? this.onProxy,
      proxyContainer: proxyContainer ?? this.proxyContainer,
      onProxyContainer: onProxyContainer ?? this.onProxyContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      surfaceContainerHighest: Color.lerp(surfaceContainerHighest, other.surfaceContainerHighest, t),
      surfaceContainerHigh: Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t),
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t),
      surfaceContainerLow: Color.lerp(surfaceContainerLow, other.surfaceContainerLow, t),
      surfaceContainerLowest: Color.lerp(surfaceContainerLowest, other.surfaceContainerLowest, t),
      surfaceBright: Color.lerp(surfaceBright, other.surfaceBright, t),
      surfaceDim: Color.lerp(surfaceDim, other.surfaceDim, t),
      warning: Color.lerp(warning, other.warning, t),
      onWarning: Color.lerp(onWarning, other.onWarning, t),
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t),
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t),
      proxy: Color.lerp(proxy, other.proxy, t),
      onProxy: Color.lerp(onProxy, other.onProxy, t),
      proxyContainer: Color.lerp(proxyContainer, other.proxyContainer, t),
      onProxyContainer: Color.lerp(onProxyContainer, other.onProxyContainer, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      warning: warning!.harmonizeWith(dynamic.primary),
      onWarning: onWarning!.harmonizeWith(dynamic.primary),
      warningContainer: warningContainer!.harmonizeWith(dynamic.primary),
      onWarningContainer: onWarningContainer!.harmonizeWith(dynamic.primary),
      proxy: proxy!.harmonizeWith(dynamic.primary),
      onProxy: onProxy!.harmonizeWith(dynamic.primary),
      proxyContainer: proxyContainer!.harmonizeWith(dynamic.primary),
      onProxyContainer: onProxyContainer!.harmonizeWith(dynamic.primary),
    );
  }
}
