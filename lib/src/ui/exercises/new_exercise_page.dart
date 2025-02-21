import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/data/data_manager.dart';
import 'package:yet_another_fitness_tracker/src/interactors/new_exercise_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model_state.dart';
import 'package:yet_another_fitness_tracker/src/constants/dimens.dart';
import 'package:yet_another_fitness_tracker/src/ui/exercises/new_exercise_view_model.dart';
import 'package:yet_another_fitness_tracker/src/utils/validation.dart';

class NewExercisePage extends StatefulWidget {
  static Widget build(BuildContext context, String title) {
    return MultiProvider(
      providers: [
        ProxyProvider<DataManager, NewExerciseInteractor>(
          update: (_, dataManager, prev) =>
              DefaultNewExerciseInteractor(dataManager),
        ),
        ProxyProvider<NewExerciseInteractor, NewExerciseViewModel>(
          update: (context, interactor, previous) =>
              NewExerciseViewModel(context, interactor),
        ),
      ],
      child: const NewExercisePage(),
    );
  }

  const NewExercisePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewExercisePageState();
}

class _NewExercisePageState
    extends LoadableViewModelState<NewExercisePage, NewExerciseViewModel> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spaceLarge),
      child: ChangeNotifierProvider.value(
        value: viewModel,
        child: viewModelConsumer(
          builder: (_, viewModel, child) => _getForm(context),
        ),
      ),
    );
  }

  Widget _getForm(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: S.of(context).addNewExerciseDefinitionNameHint,
                  ),
                  onChanged: (value) {
                    viewModel.name = value;
                  },
                  validator: buildValidator(context: context, minLength: 5),
                ),
                const SizedBox(height: Dimens.spaceLarge),
                DropdownButtonFormField(
                  icon: const Icon(FeatherIcons.arrowDown),
                  isExpanded: true,
                  value: viewModel.exerciseType,
                  onChanged: (ExerciseType? value) {
                    viewModel.exerciseType = value;
                  },
                  validator: buildValidator(context: context),
                  items: viewModel.exerciseTypeList
                      .map((value) => DropdownMenuItem(
                          child: Text(value.name), value: value))
                      .toList(),
                ),
                const SizedBox(height: Dimens.spaceLarge),
                DropdownButtonFormField(
                  icon: const Icon(FeatherIcons.arrowDown),
                  isExpanded: true,
                  value: viewModel.measurementDimension,
                  onChanged: (MeasurementDimension? value) {
                    viewModel.measurementDimension = value;
                  },
                  validator: buildValidator(context: context),
                  items: viewModel.measurementDimensions
                      .map(
                        (value) => DropdownMenuItem(
                          child: Text(value.name),
                          value: value,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: Dimens.spaceLarge),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      viewModel.saveExercise().then(
                            (value) => {Navigator.pop(context)},
                            onError: (error) => {},
                          );
                    }
                  },
                  child: Text(S.of(context).addExercise),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
