
import 'package:flutter/material.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';

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
