import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/src/data/local/shared_prefs.dart';
import 'package:yet_another_fitness_tracker/src/interactors/exercise_set_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/models/rep.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';

class ExerciseSetViewModel extends InteractorViewModel<ExerciseSetInteractor> {
  List<RepType>? repTypes;

  Exercise? exercise;

  List<RepGroup> repGroups = [];

  MeasurementSystem measurementSystem;

  late RepType _selectedType;

  ExerciseSetViewModel(super.context, super.interactor)
      : measurementSystem = Provider.of<SharedPrefs>(context).weightMeasurement {
    load();
  }

  RepType get selectedType => _selectedType;

  set selectedType(RepType value) {
    _selectedType = value;
    notifyListeners();
  }

  void load() async {
    loading = true;
    notifyListeners();
    repTypes = await interactor.getRepTypes();
    _selectedType =
        repTypes!.firstWhere((element) => element.id == RepType.repTypeFullId);
    loading = false;
    notifyListeners();
  }

  void saveExerciseSet() {
    interactor.saveExerciseSet(measurementSystem, exercise!, repGroups);
  }
}
