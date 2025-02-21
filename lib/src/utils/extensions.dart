import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';

extension ColorTransfomations on Color {
  MaterialColor get materialColor {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = red, g = green, b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }
}

extension ThemeModeLocalizedString on ThemeMode {
  String localizedString(context) {
    switch (this) {
      case ThemeMode.system:
        return S.of(context).themeModeSystem;
      case ThemeMode.light:
        return S.of(context).themeModeLight;
      case ThemeMode.dark:
        return S.of(context).themeModeDark;
    }
  }
}

extension UseWhiteForeground on Color {
  bool useWhiteForeground({double bias = 1.0}) {
    int v =
        sqrt(pow(red, 2) * 0.299 + pow(green, 2) * 0.587 + pow(blue, 2) * 0.114)
            .round();
    return v < 130 * bias ? true : false;
  }
}

extension DateTimeUtils on DateTime {
  DateTime get dateOnly => DateUtils.dateOnly(this);

  bool get isCurrentYear => year == DateTime.now().year;

  bool get isToday => DateUtils.isSameDay(this, DateTime.now());

  bool get isTomorrow =>
      DateUtils.isSameDay(this, DateTime.now().add(const Duration(days: 1)));

  bool get isYesterday =>
      DateUtils.isSameDay(this, DateTime.now().add(const Duration(days: -1)));
}
