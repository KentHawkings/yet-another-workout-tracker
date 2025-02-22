import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yet_another_fitness_tracker/src/constants/dimens.dart';
import 'package:yet_another_fitness_tracker/src/extensions/color_extensions.dart';
import 'package:yet_another_fitness_tracker/src/data/local/shared_prefs.dart';

class Themer extends ChangeNotifier {
  final SharedPrefs _prefs;

  Themer(this._prefs);

  void setThemeMode(ThemeMode themeMode) async {
    await _prefs.setThemeMode(themeMode);
    notifyListeners();
  }

  ThemeMode get themeMode => _prefs.themeMode;

  void setPrimaryColor(Color color) async {
    await _prefs.setPrimaryColor(color);
    notifyListeners();
  }

  ThemeData getLightTheme(BuildContext context) =>
      _getBaseTheme(context, Brightness.light);

  ThemeData getDarkTheme(BuildContext context) =>
      _getBaseTheme(context, Brightness.dark);

  ThemeData _getBaseTheme(BuildContext context, Brightness brightness) {
    return ThemeData(
      primarySwatch: _prefs.primaryColor.materialColor,
      primaryColor: _prefs.primaryColor,
      primaryColorDark: _prefs.primaryColor,
      brightness: brightness,
      inputDecorationTheme: _inputDecorationTheme,
      appBarTheme: _getAppBarTheme(context, brightness),
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      floatingActionButtonTheme: _fabTheme,
      textTheme: _getTextTheme(context, brightness),
      cardTheme: _cardTheme,
      radioTheme: _radioTheme,
      elevatedButtonTheme: _getElevatedButtonTheme(context),
      bottomSheetTheme: _getBottomSheetTheme(),
    );
  }

  BottomSheetThemeData _getBottomSheetTheme() => const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.borderRadius),
            topRight: Radius.circular(Dimens.borderRadius),
          ),
        ),
      );

  ElevatedButtonThemeData _getElevatedButtonTheme(BuildContext context) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.borderRadius),
          ),
        ),
      );

  TextTheme _getTextTheme(BuildContext context, Brightness brightness) {
    final TextTheme base =
        GoogleFonts.comfortaaTextTheme(Theme.of(context).textTheme);
    convert(TextStyle style) => style.copyWith(
          color:
              brightness == Brightness.dark ? Colors.white70 : Colors.black87,
          fontWeight: FontWeight.w600,
        );

    return base.copyWith(
      bodyLarge: convert(base.bodyLarge!),
      bodyMedium: convert(base.bodyMedium!),
      titleMedium: convert(base.titleMedium!),
      titleSmall: convert(base.titleSmall!),
      displayLarge: convert(base.displayLarge!),
      displayMedium: convert(base.displayMedium!),
      displaySmall: convert(base.displaySmall!),
      headlineMedium: convert(base.headlineMedium!),
      headlineSmall: convert(base.headlineSmall!),
      titleLarge: convert(base.titleLarge!),
      labelLarge: convert(base.labelLarge!),
      bodySmall: convert(base.bodySmall!),
      labelSmall: convert(base.labelSmall!),
    );
  }

  BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: _prefs.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      );

  FloatingActionButtonThemeData get _fabTheme => FloatingActionButtonThemeData(
        backgroundColor: _prefs.primaryColor,
        foregroundColor: _prefs.primaryColor.useWhiteForeground()
            ? Colors.white
            : Colors.black87,
      );

  RadioThemeData get _radioTheme => RadioThemeData(
        fillColor:
            WidgetStateColor.resolveWith((states) => _prefs.primaryColor),
      );

  InputDecorationTheme get _inputDecorationTheme => const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.borderRadius),
          ),
        ),
      );

  CardTheme get _cardTheme => const CardTheme();

  AppBarTheme _getAppBarTheme(BuildContext context, Brightness brightness) =>
      AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor:
            brightness == Brightness.dark ? Colors.white70 : Colors.black87,
        centerTitle: true,
        iconTheme: IconThemeData(
          color:
              brightness == Brightness.dark ? Colors.white70 : Colors.black87,
        ),
        actionsIconTheme: IconThemeData(
          color:
              brightness == Brightness.dark ? Colors.white70 : Colors.black87,
        ),
      );
}
