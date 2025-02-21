import 'package:flutter/material.dart';
import 'package:yet_another_fitness_tracker/src/data/local/shared_prefs.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/themer.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';

class SettingsViewModel extends ViewModel {
  final Themer _themer;

  final SharedPrefs _prefs;

  SettingsViewModel(this._themer, this._prefs);

  ThemeMode get themeMode => _themer.themeMode;

  set themeMode(ThemeMode themeMode) {
    _themer.setThemeMode(themeMode);
    notifyListeners();
  }

  MeasurementSystem get weightMeasurement => _prefs.weightMeasurement;

  void setWeightMeasurement(MeasurementSystem value) async {
    await _prefs.setWeightMeasurement(value);
    notifyListeners();
  }

  Color get primaryColor => _prefs.primaryColor;

  void setPrimaryColor(Color color) async {
    _themer.setPrimaryColor(color);
    // No need to notify here, will get notified through Themer.
  }
}
