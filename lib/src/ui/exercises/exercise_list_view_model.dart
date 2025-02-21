import 'package:yet_another_fitness_tracker/src/interactors/exercise_list_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';

class ExerciseListViewModel
    extends InteractorViewModel<ExerciseListInteractor> {
  List<Exercise>? _model;

  ExerciseListViewModel(super.context, super.interactor) {
    load();
  }

  void load() async {
    loading = true;
    notifyListeners();
    _model = await interactor.getExerciseList();
    loading = false;
    notifyListeners();
  }

  Exercise? getExercise(int index) => _model?[index];

  int get itemCount => _model?.length ?? 0;
}
