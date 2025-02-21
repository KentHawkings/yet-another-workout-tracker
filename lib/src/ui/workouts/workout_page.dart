import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/interactors/workout_interactor.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model_state.dart';
import 'package:yet_another_fitness_tracker/src/ui/workouts/workout_view_model.dart';

class WorkoutPage extends StatefulWidget {
  static Widget build(DateTime date) {
    return MultiProvider(
      providers: [
        ProxyProvider<DataManager, WorkoutViewModel>(
          update: (_, value, previous) {
            return WorkoutViewModel(
              DefaultWorkoutListInteractor(value),
              date,
            );
          },
        ),
      ],
      child: const WorkoutPage(),
    );
  }

  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState
    extends LoadableViewModelState<WorkoutPage, WorkoutViewModel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: viewModel,
        child: viewModelConsumer(
          builder: (context, viewModel, child) {
            return Center(
              child: Text(viewModel.getDateText(context)),
            );
          },
        ),
      ),
    );
  }
}
