import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/interactors/exercise_set_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/rep.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model_state.dart';
import 'package:yet_another_fitness_tracker/src/ui/workouts/exercise_set_view_model.dart';
import 'package:yet_another_fitness_tracker/src/constants/dimens.dart';
import 'package:yet_another_fitness_tracker/src/utils/validation.dart';

class ExerciseSetPage extends StatefulWidget {
  static Widget build([Exercise? exercise]) {
    return MultiProvider(
      providers: [
        ProxyProvider<DataManager, DefaultExerciseSetInteractor>(
          update: (_, dataManager, prev) =>
              DefaultExerciseSetInteractor(dataManager),
        ),
        ProxyProvider<DefaultExerciseSetInteractor, ExerciseSetViewModel>(
          update: (context, interactor, previous) =>
              ExerciseSetViewModel(context, interactor),
        ),
      ],
      builder: (context, _) => ExerciseSetPage(exercise: exercise),
    );
  }

  final Exercise? exercise;

  const ExerciseSetPage({Key? key, this.exercise}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExerciseSetPageState();
}

class _ExerciseSetPageState
    extends LoadableViewModelState<ExerciseSetPage, ExerciseSetViewModel> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spaceLarge),
      child: ChangeNotifierProvider.value(
        value: viewModel,
        child: viewModelConsumer(
          builder: (context, viewModel, child) {
            return _buildForm(context);
          },
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildExerciseSetInput(),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                viewModel.saveExerciseSet();
              }
            },
            child: Text(S.of(context).addExercise),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseSetInput() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 2,
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.zero,
                  topRight: Radius.zero,
                ),
              ),
              labelText: S.of(context).numberOfReps,
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            validator: buildValidator(context: context),
          ),
        ),
        Flexible(
          flex: 1,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.zero,
                  topLeft: Radius.zero,
                ),
              ),
              labelText: S.of(context).repTypeFull,
            ),
            icon: const Icon(FeatherIcons.arrowDown),
            onChanged: (RepType? value) {
              viewModel.selectedType = value!;
            },
            validator: buildValidator(context: context),
            value: viewModel.selectedType,
            items: viewModel.repTypes!
                .map(
                  (value) => DropdownMenuItem(
                    child: Text(value.name),
                    value: value,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
