import 'package:yet_another_fitness_tracker/src/interactors/exercise_type_list_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';

class ExerciseTypeListViewModel
    extends InteractorViewModel<ExerciseTypeListInteractor> {
  List<ExerciseType>? _model;

  ExerciseType? _selectedExerciseType;

  ExerciseTypeListViewModel(
    super.context,
    super.interactor,
  ) {
    load();
  }

  void load() async {
    loading = true;
    notifyListeners();
    _model = await interactor.getExerciseTypeList();
    loading = false;
    notifyListeners();
  }

  ExerciseType? get selectedExerciseType => _selectedExerciseType;

  set selectedExerciseType(ExerciseType? value) {
    _selectedExerciseType = value;
    notifyListeners();
  }

  ExerciseType? getExerciseType(int index) => _model?[index];

  int get itemCount => _model?.length ?? 0;
}
