import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/interactors/exercise_list_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model_state.dart';
import 'package:yet_another_fitness_tracker/src/ui/exercises/exercise_list_view_model.dart';
import 'package:yet_another_fitness_tracker/src/ui/workouts/exercise_set_page.dart';

class ExerciseListPage extends StatefulWidget {
  static Widget build(BuildContext context, ExerciseType type, Key? key) {
    return MultiProvider(
      providers: [
        ProxyProvider<DataManager, ExerciseListInteractor>(
          update: (_, dataManager, prev) =>
              DefaultExerciseListInteractor(dataManager, type),
        ),
        ProxyProvider<ExerciseListInteractor, ExerciseListViewModel>(
          update: (context, interactor, previous) =>
              ExerciseListViewModel(context, interactor),
        ),
      ],
      child: ExerciseListPage(
        key: key,
      ),
    );
  }

  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState
    extends LoadableViewModelState<ExerciseListPage, ExerciseListViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: viewModelConsumer(
        builder: (_, viewModel, child) {
          return Container(
            child: _buildList(viewModel),
            color: Colors.amber,
          );
        },
      ),
    );
  }

  Widget _buildList(ExerciseListViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.itemCount,
      itemBuilder: (BuildContext context, int index) {
        var exercise = viewModel.getExercise(index)!;
        return ListTile(
          title: Text(exercise.name),
          onTap: () {
            _onExerciseSelected(context);
          },
        );
      },
    );
  }

  _onExerciseSelected(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ExerciseSetPage.build();
        },
      ),
    );
  }
}
