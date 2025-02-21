import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';

abstract class DataManagerInteractor {
  final DataManager dataManager;

  DataManagerInteractor(this.dataManager);
}
