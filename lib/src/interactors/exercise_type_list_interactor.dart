import 'package:yet_another_fitness_tracker/src/interactors/datamanager_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';

abstract class ExerciseTypeListInteractor {
  Future<List<ExerciseType>> getExerciseTypeList();

  Future<Exercise> addExercise(
      String name, MeasurementDimension dimensions, ExerciseType type);
}

class DefaultExerciseTypeListInteractor extends DataManagerInteractor
    implements ExerciseTypeListInteractor {
  DefaultExerciseTypeListInteractor(super.dataManager);

  @override
  Future<List<ExerciseType>> getExerciseTypeList() =>
      dataManager.getExerciseTypeList();

  @override
  Future<Exercise> addExercise(
          String name, MeasurementDimension dimensions, ExerciseType type) =>
      dataManager.addExercise(name, dimensions, type);
}
