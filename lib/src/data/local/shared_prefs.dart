import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';

class SharedPrefs {
  static const _sharedPrefsThemeMode = 'sharedPrefsThemeMode';
  static const _sharedPrefsPrimaryColor = 'sharedPrefsPrimaryColor';
  static const _sharedPrefsWeightMeasurement = 'sharedPrefsWeightMeasurement';
  static const _sharedPrefsDbSeeded = 'sharedPrefsDbSeeded';

  final SharedPreferences _prefs;

  SharedPrefs(this._prefs);

  Future<bool> setThemeMode(ThemeMode themeMode) =>
      _prefs.setInt(_sharedPrefsThemeMode, themeMode.index);

  ThemeMode get themeMode {
    int index = _prefs.getInt(_sharedPrefsThemeMode) ?? 0;

    return ThemeMode.values[index];
  }

  Future<bool> setPrimaryColor(Color color) =>
      _prefs.setInt(_sharedPrefsPrimaryColor, color.toARGB32());

  Color get primaryColor {
    int primaryColor =
        _prefs.getInt(_sharedPrefsPrimaryColor) ?? Colors.purple.toARGB32();
    return Color(primaryColor);
  }

  Future<bool> setDbSeeded(bool seeded) =>
      _prefs.setBool(_sharedPrefsDbSeeded, seeded);

  bool get dbSeeded => _prefs.getBool(_sharedPrefsDbSeeded) ?? false;

  Future<bool> setWeightMeasurement(MeasurementSystem value) =>
      _prefs.setInt(_sharedPrefsWeightMeasurement, value.id);

  MeasurementSystem get weightMeasurement {
    var index = _prefs.getInt(_sharedPrefsWeightMeasurement);
    return MeasurementSystem.fromId(index);
  }
}
