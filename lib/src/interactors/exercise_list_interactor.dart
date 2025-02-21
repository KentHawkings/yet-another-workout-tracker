import 'package:yet_another_fitness_tracker/src/interactors/datamanager_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';

abstract class ExerciseListInteractor {
  Future<List<Exercise>> getExerciseList();

  Future<Exercise> addExercise(
      String name, MeasurementDimension dimensions, ExerciseType type);
}

class DefaultExerciseListInteractor extends DataManagerInteractor
    implements ExerciseListInteractor {
  final ExerciseType type;

  DefaultExerciseListInteractor(super.dataManager, this.type);

  @override
  Future<List<Exercise>> getExerciseList() async => type.exercises.toList();

  @override
  Future<Exercise> addExercise(
          String name, MeasurementDimension dimensions, ExerciseType type) =>
      dataManager.addExercise(name, dimensions, type);
}
