import 'package:yet_another_fitness_tracker/src/interactors/datamanager_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/models/rep.dart';

abstract class ExerciseSetInteractor {
  Future<List<RepType>> getRepTypes();

  Future<ExerciseSet> saveExerciseSet(
      MeasurementSystem system, Exercise exercise, List<RepGroup> repGroups);
}

class DefaultExerciseSetInteractor extends DataManagerInteractor
    implements ExerciseSetInteractor {
  DefaultExerciseSetInteractor(super.dataManager);

  @override
  Future<List<RepType>> getRepTypes() => dataManager.getRepTypes();

  @override
  Future<ExerciseSet> saveExerciseSet(MeasurementSystem system,
          Exercise exercise, List<RepGroup> repGroups) =>
      dataManager.saveExerciseSet(system, exercise, repGroups);
}
