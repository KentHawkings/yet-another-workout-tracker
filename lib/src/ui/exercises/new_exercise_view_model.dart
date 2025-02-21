import 'package:yet_another_fitness_tracker/src/interactors/new_exercise_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';

class NewExerciseViewModel extends InteractorViewModel<NewExerciseInteractor> {
  MeasurementDimension? _measurementDimension;

  String? _name;

  ExerciseType? _exerciseType;

  List<ExerciseType> exerciseTypeList = [];

  List<MeasurementDimension> measurementDimensions = [];

  NewExerciseViewModel(super.context, super.interactor,
      [Exercise? exercise])
      : _measurementDimension = exercise?.dimension.target,
        _name = exercise?.name,
        _exerciseType = exercise?.type.target {
    load();
  }

  MeasurementDimension? get measurementDimension => _measurementDimension;

  set measurementDimension(MeasurementDimension? value) {
    _measurementDimension = value;
    notifyListeners();
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
    notifyListeners();
  }

  ExerciseType? get exerciseType => _exerciseType;

  set exerciseType(ExerciseType? value) {
    _exerciseType = value;
    notifyListeners();
  }

  Future<Exercise> saveExercise() =>
      interactor.addExercise(_name!, measurementDimension!, _exerciseType!);

  void load() async {
    loading = true;
    notifyListeners();
    exerciseTypeList = await interactor.getExerciseTypeList();
    measurementDimensions = await interactor.getExerciseDimensions();
    loading = false;
    notifyListeners();
  }
}
