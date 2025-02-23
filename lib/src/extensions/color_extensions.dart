import 'package:flutter/material.dart';

extension ColorTransformations on Color {
  MaterialColor get materialColor {
    // Start with an initial strength of 5%
    List<double> strengths = <double>[0.05];
    final swatch = <int, Color>{};

    // Convert the new double-based getters into ints
    final int r = this.r.toInt();
    final int g = this.g.toInt();
    final int b = this.b.toInt();

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
    return MaterialColor(toARGB32(), swatch);
  }
}

extension UseWhiteForeground on Color {
  bool useWhiteForeground() {
    var brightness = ThemeData.estimateBrightnessForColor(this);
    switch (brightness) {
      case Brightness.light:
        return false;
      case Brightness.dark:
        return true;
    }
  }
}
