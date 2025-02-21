import 'package:flutter/widgets.dart';
import 'package:yet_another_fitness_tracker/src/data/local/database.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/data/local/seed/exercise_provider.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/models/rep.dart';

class DatabaseSeeder {
  static const int _backIndex = 0;
  static const int _bicepsIndex = 1;
  static const int _tricepsIndex = 2;
  static const int _legsIndex = 3;
  static const int _absIndex = 4;
  static const int _chestIndex = 5;
  static const int _shouldersIndex = 6;
  static const int _cardioIndex = 7;

  static const int _weightAndRepsIndex = 0;
  static const int _timeIndex = 8;

  final Database _database;

  final ExerciseProvider _defaultLegExerciseProvider;
  final ExerciseProvider _defaultChestExerciseProvider;
  final ExerciseProvider _defaultBackExerciseProvider;
  final ExerciseProvider _defaultBicepsExerciseProvider;
  final ExerciseProvider _defaultTricepsExerciseProvider;
  final ExerciseProvider _defaultShoulderExerciseProvider;
  final ExerciseProvider _defaultAbsExerciseProvider;
  final ExerciseProvider _defaultCardioExerciseProvider;

  DatabaseSeeder(this._database,
      [this._defaultLegExerciseProvider = createLegExercises,
      this._defaultChestExerciseProvider = createChestExercises,
      this._defaultBackExerciseProvider = createBackExercises,
      this._defaultBicepsExerciseProvider = createBicepsExercises,
      this._defaultTricepsExerciseProvider = createTricepsExercises,
      this._defaultShoulderExerciseProvider = createShoulderExercises,
      this._defaultAbsExerciseProvider = createAbsExercises,
      this._defaultCardioExerciseProvider = createCardioExercises]);

  Future<void> seed(BuildContext context) async {
    var exerciseTypes = _getExerciseTypes(context);
    var dimensions = _getMeasurementDimensions(context);
    await _seedExercises(context, exerciseTypes, dimensions);
    await _seedRepTypes(context);
  }

  Future<List<Exercise>> _seedExercises(
      BuildContext context,
      List<ExerciseType> exerciseTypes,
      List<MeasurementDimension> dimensions) async {
    List<Exercise> legExercises = _defaultLegExerciseProvider(
        context, exerciseTypes[_legsIndex], dimensions[_weightAndRepsIndex]);
    List<Exercise> chestExercises = _defaultChestExerciseProvider(
      context,
      exerciseTypes[_chestIndex],
      dimensions[_weightAndRepsIndex],
    );
    List<Exercise> backExercises = _defaultBackExerciseProvider(
      context,
      exerciseTypes[_backIndex],
      dimensions[_weightAndRepsIndex],
    );
    List<Exercise> bicepsExercises = _defaultBicepsExerciseProvider(
      context,
      exerciseTypes[_bicepsIndex],
      dimensions[_weightAndRepsIndex],
    );
    List<Exercise> tricepsExercises = _defaultTricepsExerciseProvider(
      context,
      exerciseTypes[_tricepsIndex],
      dimensions[_weightAndRepsIndex],
    );
    List<Exercise> shoulderExercises = _defaultShoulderExerciseProvider(
      context,
      exerciseTypes[_shouldersIndex],
      dimensions[_weightAndRepsIndex],
    );
    List<Exercise> absExercises = _defaultAbsExerciseProvider(
      context,
      exerciseTypes[_absIndex],
      dimensions[_weightAndRepsIndex],
    );
    List<Exercise> cardioExercises = _defaultCardioExerciseProvider(
      context,
      exerciseTypes[_cardioIndex],
      dimensions[_timeIndex],
    );

    return _database.addExerciseList([
      ...legExercises,
      ...chestExercises,
      ...backExercises,
      ...bicepsExercises,
      ...tricepsExercises,
      ...shoulderExercises,
      ...absExercises,
      ...cardioExercises
    ]);
  }

  Future<List<RepType>> _seedRepTypes(BuildContext context) async {
    var repTypes = [
      [RepType.repTypeFullId, S.of(context).repTypeFull],
      [0, S.of(context).repTypeHalf],
      [0, S.of(context).repTypeCheat],
      [0, S.of(context).repTypeSpotted]
    ].map((e) => RepType(id: e[0], name: e[1])).toList();
    return _database.addRepTypeList(repTypes);
  }

  List<ExerciseType> _getExerciseTypes(BuildContext context) => [
        S.of(context).exerciseTypeBack,
        S.of(context).exerciseTypeBiceps,
        S.of(context).exerciseTypeTriceps,
        S.of(context).exerciseTypeLegs,
        S.of(context).exerciseTypeAbs,
        S.of(context).exerciseTypeChest,
        S.of(context).exerciseTypeShoulders,
        S.of(context).exerciseTypeCardio
      ].map((e) => ExerciseType(name: e)).toList();

  List<MeasurementDimension> _getMeasurementDimensions(BuildContext context) {
    return [
      [S.of(context).measurementDimensionWeightAndReps, 2],
      [S.of(context).measurementDimensionWeightAndDistance, 2],
      [S.of(context).measurementDimensionWeightAndTime, 2],
      [S.of(context).measurementDimensionRepsAndDistance, 2],
      [S.of(context).measurementDimensionRepsAndTime, 2],
      [S.of(context).measurementDimensionWeight, 1],
      [S.of(context).measurementDimensionReps, 1],
      [S.of(context).measurementDimensionDistance, 1],
      [S.of(context).measurementDimensionTime, 1]
    ]
        .map((e) => MeasurementDimension(name: e[0], dimensionality: e[1]))
        .toList();
  }
}
