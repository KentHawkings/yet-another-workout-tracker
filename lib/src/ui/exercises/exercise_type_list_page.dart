import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/interactors/exercise_type_list_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model_state.dart';
import 'package:yet_another_fitness_tracker/src/ui/exercises/exercise_list_page.dart';
import 'package:yet_another_fitness_tracker/src/ui/exercises/exercise_type_list_view_model.dart';

class ExerciseTypeListPage extends StatefulWidget {
  static Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ProxyProvider<DataManager, ExerciseTypeListInteractor>(
          update: (_, dataManager, prev) =>
              DefaultExerciseTypeListInteractor(dataManager),
        ),
        ProxyProvider<ExerciseTypeListInteractor, ExerciseTypeListViewModel>(
          update: (context, interactor, previous) =>
              ExerciseTypeListViewModel(context, interactor),
        ),
      ],
      child: const ExerciseTypeListPage(),
    );
  }

  const ExerciseTypeListPage({Key? key}) : super(key: key);

  @override
  State<ExerciseTypeListPage> createState() => _ExerciseTypeListPageState();
}

class _ExerciseTypeListPageState extends LoadableViewModelState<
    ExerciseTypeListPage, ExerciseTypeListViewModel> {
  final _xIconKey = const ValueKey('xIcon');

  final _backArrowKey = const ValueKey('backArrowIcon');

  final _exerciseTypeListKey = const ValueKey('exerciseTypeList');

  final _exerciseListKey = const ValueKey('exerciseList');

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: viewModelConsumer(
        builder: (_, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).selectExercise),
              leading: _buildIcon(),
            ),
            body: _buildList(viewModel),
          );
        },
      ),
    );
  }

  Widget _buildIcon() {
    return IconButton(
      icon: AnimatedSwitcher(
        duration: Durations.short4,
        transitionBuilder: (child, anim) => RotationTransition(
          turns: child.key == _xIconKey
              ? Tween<double>(begin: 1, end: 0.75).animate(anim)
              : Tween<double>(begin: 0.75, end: 1).animate(anim),
          child: ScaleTransition(scale: anim, child: child),
        ),
        child: viewModel.selectedExerciseType == null
            ? Icon(
                Icons.close,
                key: _xIconKey,
              )
            : Icon(
                Icons.arrow_back,
                key: _backArrowKey,
              ),
      ),
      onPressed: () {
        if (statelessViewModel.selectedExerciseType == null) {
          Navigator.pop(context);
        } else {
          statelessViewModel.selectedExerciseType = null;
        }
      },
    );
  }

  Widget _buildList(ExerciseTypeListViewModel viewModel) {
    Widget child;
    if (viewModel.selectedExerciseType == null) {
      child = _buildExerciseTypeList(viewModel);
    } else {
      child = _exerciseListPage(viewModel.selectedExerciseType!);
    }
    return AnimatedSwitcher(
      transitionBuilder: (child, anim) {
        return SlideTransition(
          position: child.key == _exerciseTypeListKey
              ? Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(anim)
              : Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(anim),
          child: child,
        );
      },
      duration: Durations.short4,
      child: child,
    );
  }

  Widget _buildExerciseTypeList(ExerciseTypeListViewModel viewModel) {
    return ListView.builder(
      key: _exerciseTypeListKey,
      itemCount: viewModel.itemCount,
      itemBuilder: (context, index) {
        var type = viewModel.getExerciseType(index)!;
        return ListTile(
          title: Text(type.name),
          trailing: const Icon(FeatherIcons.chevronRight),
          onTap: () {
            _onExerciseTypeSelected(type);
          },
        );
      },
    );
  }

  _onExerciseTypeSelected(ExerciseType type) {
    statelessViewModel.selectedExerciseType = type;
  }

  Widget _exerciseListPage(ExerciseType type) {
    return ExerciseListPage.build(context, type, _exerciseListKey);
  }
}
