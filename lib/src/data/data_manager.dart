import 'package:yet_another_fitness_tracker/src/data/local/database.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/models/rep.dart';
import 'package:yet_another_fitness_tracker/src/models/workout.dart';

class DataManager {
  final Database _database;

  DataManager(this._database);

  Future<List<Workout>> getWorkouts(DateTime date) =>
      _database.getWorkouts(date);

  Future<ExerciseType> addExerciseType(String name) =>
      _database.addExerciseType(name);

  Future<Exercise> addExercise(
          String name, MeasurementDimension dimensions, ExerciseType type) =>
      _database.addExercise(name, dimensions, type);

  Future<List<MeasurementDimension>> getDimensions() =>
      _database.getMeasurementDimensions();

  Future<List<RepType>> getRepTypes() => _database.getRepTypes();

  Future<List<ExerciseType>> getExerciseTypeList() =>
      _database.getExerciseTypeList();

  Future<ExerciseSet> saveExerciseSet(MeasurementSystem system,
          Exercise exercise, List<RepGroup> repGroups) =>
      _database.saveExerciseSet(system, exercise, repGroups);
}
