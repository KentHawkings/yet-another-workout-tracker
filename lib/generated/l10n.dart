// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add Exercise`
  String get addExercise {
    return Intl.message(
      'Add Exercise',
      name: 'addExercise',
      desc: '',
      args: [],
    );
  }

  /// `Add New Exercise`
  String get addNewExercise {
    return Intl.message(
      'Add New Exercise',
      name: 'addNewExercise',
      desc: '',
      args: [],
    );
  }

  /// `Add New Set`
  String get addNewExerciseSet {
    return Intl.message(
      'Add New Set',
      name: 'addNewExerciseSet',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Name`
  String get addNewExerciseDefinitionNameHint {
    return Intl.message(
      'Exercise Name',
      name: 'addNewExerciseDefinitionNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Yet Another Fitness Tracker`
  String get appTitle {
    return Intl.message(
      'Yet Another Fitness Tracker',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Confirm`
  String get confirmableButtonConfirm {
    return Intl.message(
      'Confirm',
      name: 'confirmableButtonConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get dateToday {
    return Intl.message('Today', name: 'dateToday', desc: '', args: []);
  }

  /// `Yesterday`
  String get dateYesterday {
    return Intl.message('Yesterday', name: 'dateYesterday', desc: '', args: []);
  }

  /// `Tomorrow`
  String get dateTomorrow {
    return Intl.message('Tomorrow', name: 'dateTomorrow', desc: '', args: []);
  }

  /// `Edit Exercise`
  String get editExercise {
    return Intl.message(
      'Edit Exercise',
      name: 'editExercise',
      desc: '',
      args: [],
    );
  }

  /// `This Field is Required`
  String get errorFieldRequired {
    return Intl.message(
      'This Field is Required',
      name: 'errorFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Barbell Bench Press`
  String get exerciseBarbellBenchPress {
    return Intl.message(
      'Barbell Bench Press',
      name: 'exerciseBarbellBenchPress',
      desc: '',
      args: [],
    );
  }

  /// `Barbell Curl`
  String get exerciseBarbellCurl {
    return Intl.message(
      'Barbell Curl',
      name: 'exerciseBarbellCurl',
      desc: '',
      args: [],
    );
  }

  /// `Barbell Front Raise`
  String get exerciseBarbellFrontRaise {
    return Intl.message(
      'Barbell Front Raise',
      name: 'exerciseBarbellFrontRaise',
      desc: '',
      args: [],
    );
  }

  /// `Barbell Front Squat`
  String get exerciseBarbellFrontSquat {
    return Intl.message(
      'Barbell Front Squat',
      name: 'exerciseBarbellFrontSquat',
      desc: '',
      args: [],
    );
  }

  /// `Barbell Lunge`
  String get exerciseBarbellLunge {
    return Intl.message(
      'Barbell Lunge',
      name: 'exerciseBarbellLunge',
      desc: '',
      args: [],
    );
  }

  /// `Barbell Row`
  String get exerciseBarbellRow {
    return Intl.message(
      'Barbell Row',
      name: 'exerciseBarbellRow',
      desc: '',
      args: [],
    );
  }

  /// `Barbell Squat`
  String get exerciseBarbellSquat {
    return Intl.message(
      'Barbell Squat',
      name: 'exerciseBarbellSquat',
      desc: '',
      args: [],
    );
  }

  /// `Cable Crossover`
  String get exerciseCableCrossover {
    return Intl.message(
      'Cable Crossover',
      name: 'exerciseCableCrossover',
      desc: '',
      args: [],
    );
  }

  /// `Cable Rows`
  String get exerciseCableRows {
    return Intl.message(
      'Cable Rows',
      name: 'exerciseCableRows',
      desc: '',
      args: [],
    );
  }

  /// `Cambered Bar Curl`
  String get exerciseCamberedBarCurl {
    return Intl.message(
      'Cambered Bar Curl',
      name: 'exerciseCamberedBarCurl',
      desc: '',
      args: [],
    );
  }

  /// `Deadlift`
  String get exerciseDeadlift {
    return Intl.message(
      'Deadlift',
      name: 'exerciseDeadlift',
      desc: '',
      args: [],
    );
  }

  /// `Dead Bugs`
  String get exerciseDeadBugs {
    return Intl.message(
      'Dead Bugs',
      name: 'exerciseDeadBugs',
      desc: '',
      args: [],
    );
  }

  /// `Dumbbell Bench Press`
  String get exerciseDumbbellBenchPress {
    return Intl.message(
      'Dumbbell Bench Press',
      name: 'exerciseDumbbellBenchPress',
      desc: '',
      args: [],
    );
  }

  /// `Dumbbell Rows`
  String get exerciseDumbbellRows {
    return Intl.message(
      'Dumbbell Rows',
      name: 'exerciseDumbbellRows',
      desc: '',
      args: [],
    );
  }

  /// `Dumbbell Lunge`
  String get exerciseDumbbellLunge {
    return Intl.message(
      'Dumbbell Lunge',
      name: 'exerciseDumbbellLunge',
      desc: '',
      args: [],
    );
  }

  /// `Dumbbell Curl`
  String get exerciseDumbbellCurl {
    return Intl.message(
      'Dumbbell Curl',
      name: 'exerciseDumbbellCurl',
      desc: '',
      args: [],
    );
  }

  /// `Dumbbell Lateral Raise`
  String get exerciseDumbbellLateralRaise {
    return Intl.message(
      'Dumbbell Lateral Raise',
      name: 'exerciseDumbbellLateralRaise',
      desc: '',
      args: [],
    );
  }

  /// `Elliptical Machine`
  String get exerciseEllipticalMachine {
    return Intl.message(
      'Elliptical Machine',
      name: 'exerciseEllipticalMachine',
      desc: '',
      args: [],
    );
  }

  /// `EZ-Bar Skullcrusher`
  String get exerciseEZBarSkullcrusher {
    return Intl.message(
      'EZ-Bar Skullcrusher',
      name: 'exerciseEZBarSkullcrusher',
      desc: '',
      args: [],
    );
  }

  /// `EZ-Bar Curl`
  String get exerciseEZBarCurl {
    return Intl.message(
      'EZ-Bar Curl',
      name: 'exerciseEZBarCurl',
      desc: '',
      args: [],
    );
  }

  /// `Abs`
  String get exerciseTypeAbs {
    return Intl.message('Abs', name: 'exerciseTypeAbs', desc: '', args: []);
  }

  /// `Back`
  String get exerciseTypeBack {
    return Intl.message('Back', name: 'exerciseTypeBack', desc: '', args: []);
  }

  /// `Biceps`
  String get exerciseTypeBiceps {
    return Intl.message(
      'Biceps',
      name: 'exerciseTypeBiceps',
      desc: '',
      args: [],
    );
  }

  /// `Cardio`
  String get exerciseTypeCardio {
    return Intl.message(
      'Cardio',
      name: 'exerciseTypeCardio',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get exerciseTypeChest {
    return Intl.message('Chest', name: 'exerciseTypeChest', desc: '', args: []);
  }

  /// `Legs`
  String get exerciseTypeLegs {
    return Intl.message('Legs', name: 'exerciseTypeLegs', desc: '', args: []);
  }

  /// `Shoulders`
  String get exerciseTypeShoulders {
    return Intl.message(
      'Shoulders',
      name: 'exerciseTypeShoulders',
      desc: '',
      args: [],
    );
  }

  /// `Triceps`
  String get exerciseTypeTriceps {
    return Intl.message(
      'Triceps',
      name: 'exerciseTypeTriceps',
      desc: '',
      args: [],
    );
  }

  /// `Dumbbell Front Raise`
  String get exerciseDumbbellFrontRaise {
    return Intl.message(
      'Dumbbell Front Raise',
      name: 'exerciseDumbbellFrontRaise',
      desc: '',
      args: [],
    );
  }

  /// `Hanging Leg Raise`
  String get exerciseHangingLegRaise {
    return Intl.message(
      'Hanging Leg Raise',
      name: 'exerciseHangingLegRaise',
      desc: '',
      args: [],
    );
  }

  /// `Hyperextensions`
  String get exerciseHyperextensions {
    return Intl.message(
      'Hyperextensions',
      name: 'exerciseHyperextensions',
      desc: '',
      args: [],
    );
  }

  /// `Incline Barbell Bench Press`
  String get exerciseInclineBarbellBenchPress {
    return Intl.message(
      'Incline Barbell Bench Press',
      name: 'exerciseInclineBarbellBenchPress',
      desc: '',
      args: [],
    );
  }

  /// `Incline Cable Rows`
  String get exerciseInclineCableRows {
    return Intl.message(
      'Incline Cable Rows',
      name: 'exerciseInclineCableRows',
      desc: '',
      args: [],
    );
  }

  /// `Incline Dumbbell Bench Press`
  String get exerciseInclineDumbbellBenchPress {
    return Intl.message(
      'Incline Dumbbell Bench Press',
      name: 'exerciseInclineDumbbellBenchPress',
      desc: '',
      args: [],
    );
  }

  /// `Leg Curls`
  String get exerciseLegCurls {
    return Intl.message(
      'Leg Curls',
      name: 'exerciseLegCurls',
      desc: '',
      args: [],
    );
  }

  /// `Leg Extensions`
  String get exerciseLegExtensions {
    return Intl.message(
      'Leg Extensions',
      name: 'exerciseLegExtensions',
      desc: '',
      args: [],
    );
  }

  /// `Parallel Bar Dip`
  String get exerciseParallelBarDip {
    return Intl.message(
      'Parallel Bar Dip',
      name: 'exerciseParallelBarDip',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Plank`
  String get exercisePlank {
    return Intl.message(
      'Exercise Plank',
      name: 'exercisePlank',
      desc: '',
      args: [],
    );
  }

  /// `Pull Up`
  String get exercisePullUp {
    return Intl.message('Pull Up', name: 'exercisePullUp', desc: '', args: []);
  }

  /// `Seated Calf Raises`
  String get exerciseSeatedCalfRaises {
    return Intl.message(
      'Seated Calf Raises',
      name: 'exerciseSeatedCalfRaises',
      desc: '',
      args: [],
    );
  }

  /// `Seated Shoulder Press`
  String get exerciseSeatedShoulderPress {
    return Intl.message(
      'Seated Shoulder Press',
      name: 'exerciseSeatedShoulderPress',
      desc: '',
      args: [],
    );
  }

  /// `Standing Shoulder Press`
  String get exerciseStandingShoulderPress {
    return Intl.message(
      'Standing Shoulder Press',
      name: 'exerciseStandingShoulderPress',
      desc: '',
      args: [],
    );
  }

  /// `Standing Machine Calf Raises`
  String get exerciseStandingMachineCalfRaises {
    return Intl.message(
      'Standing Machine Calf Raises',
      name: 'exerciseStandingMachineCalfRaises',
      desc: '',
      args: [],
    );
  }

  /// `V-Bar Pushdown`
  String get exerciseVBarPushDown {
    return Intl.message(
      'V-Bar Pushdown',
      name: 'exerciseVBarPushDown',
      desc: '',
      args: [],
    );
  }

  /// `Measurement Dimension`
  String get measurementDimension {
    return Intl.message(
      'Measurement Dimension',
      name: 'measurementDimension',
      desc: '',
      args: [],
    );
  }

  /// `Weight And Reps`
  String get measurementDimensionWeightAndReps {
    return Intl.message(
      'Weight And Reps',
      name: 'measurementDimensionWeightAndReps',
      desc: '',
      args: [],
    );
  }

  /// `Weight And Distance`
  String get measurementDimensionWeightAndDistance {
    return Intl.message(
      'Weight And Distance',
      name: 'measurementDimensionWeightAndDistance',
      desc: '',
      args: [],
    );
  }

  /// `Weight And Time`
  String get measurementDimensionWeightAndTime {
    return Intl.message(
      'Weight And Time',
      name: 'measurementDimensionWeightAndTime',
      desc: '',
      args: [],
    );
  }

  /// `Reps and Distance`
  String get measurementDimensionRepsAndDistance {
    return Intl.message(
      'Reps and Distance',
      name: 'measurementDimensionRepsAndDistance',
      desc: '',
      args: [],
    );
  }

  /// `Reps and Time`
  String get measurementDimensionRepsAndTime {
    return Intl.message(
      'Reps and Time',
      name: 'measurementDimensionRepsAndTime',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get measurementDimensionWeight {
    return Intl.message(
      'Weight',
      name: 'measurementDimensionWeight',
      desc: '',
      args: [],
    );
  }

  /// `Reps`
  String get measurementDimensionReps {
    return Intl.message(
      'Reps',
      name: 'measurementDimensionReps',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get measurementDimensionDistance {
    return Intl.message(
      'Distance',
      name: 'measurementDimensionDistance',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get measurementDimensionTime {
    return Intl.message(
      'Time',
      name: 'measurementDimensionTime',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get navigationExercises {
    return Intl.message(
      'Exercises',
      name: 'navigationExercises',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get navigationSettings {
    return Intl.message(
      'Settings',
      name: 'navigationSettings',
      desc: '',
      args: [],
    );
  }

  /// `Workouts`
  String get navigationWorkouts {
    return Intl.message(
      'Workouts',
      name: 'navigationWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Number of Reps`
  String get numberOfReps {
    return Intl.message(
      'Number of Reps',
      name: 'numberOfReps',
      desc: '',
      args: [],
    );
  }

  /// `Rep Type`
  String get repType {
    return Intl.message('Rep Type', name: 'repType', desc: '', args: []);
  }

  /// `Full`
  String get repTypeFull {
    return Intl.message('Full', name: 'repTypeFull', desc: '', args: []);
  }

  /// `Half`
  String get repTypeHalf {
    return Intl.message('Half', name: 'repTypeHalf', desc: '', args: []);
  }

  /// `Cheat`
  String get repTypeCheat {
    return Intl.message('Cheat', name: 'repTypeCheat', desc: '', args: []);
  }

  /// `Spotted`
  String get repTypeSpotted {
    return Intl.message('Spotted', name: 'repTypeSpotted', desc: '', args: []);
  }

  /// `Select Exercise`
  String get selectExercise {
    return Intl.message(
      'Select Exercise',
      name: 'selectExercise',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get settingsAbout {
    return Intl.message('About', name: 'settingsAbout', desc: '', args: []);
  }

  /// `Theme`
  String get settingsTheme {
    return Intl.message('Theme', name: 'settingsTheme', desc: '', args: []);
  }

  /// `Primary Colour`
  String get settingsPrimaryColor {
    return Intl.message(
      'Primary Colour',
      name: 'settingsPrimaryColor',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeModeLight {
    return Intl.message('Light', name: 'themeModeLight', desc: '', args: []);
  }

  /// `Dark`
  String get themeModeDark {
    return Intl.message('Dark', name: 'themeModeDark', desc: '', args: []);
  }

  /// `System Default`
  String get themeModeSystem {
    return Intl.message(
      'System Default',
      name: 'themeModeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Weight Measurement`
  String get weightMeasurement {
    return Intl.message(
      'Weight Measurement',
      name: 'weightMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `Metric (KG)`
  String get weightMeasurementMetric {
    return Intl.message(
      'Metric (KG)',
      name: 'weightMeasurementMetric',
      desc: '',
      args: [],
    );
  }

  /// `Imperial (LB)`
  String get weightMeasurementImperial {
    return Intl.message(
      'Imperial (LB)',
      name: 'weightMeasurementImperial',
      desc: '',
      args: [],
    );
  }

  /// `KG`
  String get weightMeasurementMetricShort {
    return Intl.message(
      'KG',
      name: 'weightMeasurementMetricShort',
      desc: '',
      args: [],
    );
  }

  /// `LB`
  String get weightMeasurementImperialShort {
    return Intl.message(
      'LB',
      name: 'weightMeasurementImperialShort',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
