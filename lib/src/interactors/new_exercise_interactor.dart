import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/interactors/datamanager_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';

abstract class NewExerciseInteractor {
  Future<List<MeasurementDimension>> getExerciseDimensions();

  Future<List<ExerciseType>> getExerciseTypeList();

  Future<Exercise> addExercise(
      String name, MeasurementDimension dimensions, ExerciseType type);
}

class DefaultNewExerciseInteractor extends DataManagerInteractor
    with NewExerciseInteractor {
  DefaultNewExerciseInteractor(DataManager dataManager) : super(dataManager);

  @override
  Future<List<MeasurementDimension>> getExerciseDimensions() =>
      dataManager.getDimensions();

  @override
  Future<Exercise> addExercise(
          String name, MeasurementDimension dimensions, ExerciseType type) =>
      dataManager.addExercise(name, dimensions, type);

  @override
  Future<List<ExerciseType>> getExerciseTypeList() =>
      dataManager.getExerciseTypeList();
}
