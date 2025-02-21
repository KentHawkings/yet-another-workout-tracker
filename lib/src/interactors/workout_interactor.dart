import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/interactors/datamanager_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/workout.dart';

abstract class WorkoutListInteractor {
  Future<List<Workout>> getWorkoutList(DateTime date);
}

class DefaultWorkoutListInteractor extends DataManagerInteractor
    implements WorkoutListInteractor {
  DefaultWorkoutListInteractor(DataManager dataManager) : super(dataManager);

  @override
  Future<List<Workout>> getWorkoutList(DateTime date) =>
      dataManager.getWorkouts(date);
}
