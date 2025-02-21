import 'package:yet_another_fitness_tracker/objectbox.g.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/models/rep.dart';
import 'package:yet_another_fitness_tracker/src/models/workout.dart';
import 'package:yet_another_fitness_tracker/src/utils/extensions.dart';

class Database {
  final Store _store;

  Database(this._store);

  Future<List<Workout>> getWorkouts(DateTime date) async {
    return _store
        .box<Workout>()
        .query(Workout_.date
            .equals(DateTime.now().dateOnly.millisecondsSinceEpoch))
        .build()
        .find();
  }

  Future<ExerciseType> getExerciseType(int id) async =>
      _store.box<ExerciseType>().get(id)!;

  Future<Exercise> getExercise(int id) async => _store.box<Exercise>().get(id)!;

  Future<List<ExerciseType>> getExerciseTypeList() async =>
      _store.box<ExerciseType>().getAll();

  Future<ExerciseType> addExerciseType(String name) async {
    var exerciseType = ExerciseType(name: name);
    var id = await _store.box<ExerciseType>().putAsync(exerciseType);
    return _store.box<ExerciseType>().get(id)!;
  }

  Future<Exercise> addExercise(
      String name, MeasurementDimension dimensions, ExerciseType type) async {
    var exercise = type.buildExercise(name, dimensions);
    var id = await _store.box<Exercise>().putAsync(exercise);
    return _store.box<Exercise>().get(id)!;
  }

  Future<List<Exercise>> addExerciseList(List<Exercise> exercises) async {
    var ids = _store.box<Exercise>().putMany(exercises);
    return _store.box<Exercise>().getMany(ids).map((e) => e!).toList();
  }

  Future<List<RepType>> getRepTypes() async => _store.box<RepType>().getAll();

  Future<RepType> addRepType(String name) async {
    var id = _store.box<RepType>().put(RepType(name: name));
    return _store.box<RepType>().get(id)!;
  }

  Future<List<RepType>> addRepTypeList(List<RepType> repTypes) async {
    var ids = _store.box<RepType>().putMany(repTypes);
    return _store.box<RepType>().getMany(ids).map((e) => e!).toList();
  }

  Future<List<MeasurementDimension>> getMeasurementDimensions() async =>
      _store.box<MeasurementDimension>().getAll();

  Future<MeasurementDimension> addMeasurementDimension(String name) async {
    var id = _store
        .box<MeasurementDimension>()
        .put(MeasurementDimension(name: name));
    return _store.box<MeasurementDimension>().get(id)!;
  }

  Future<ExerciseSet> saveExerciseSet(MeasurementSystem system,
      Exercise exercise, List<RepGroup> repGroups) async {
    var set = ExerciseSet(measurementSystem: system)
      ..exercise.target = exercise
      ..repGroups.addAll(repGroups);
    var id = _store.box<ExerciseSet>().put(set);
    return _store.box<ExerciseSet>().get(id)!;
  }
}
