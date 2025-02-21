import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/interactors/workout_interactor.dart';
import 'package:yet_another_fitness_tracker/src/models/workout.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';
import 'package:yet_another_fitness_tracker/src/utils/extensions.dart';

class WorkoutViewModel extends LoadableViewModel {
  final WorkoutListInteractor _interactor;

  final DateTime _date;

  List<Workout>? model;

  WorkoutViewModel(this._interactor, this._date) {
    load();
  }

  String getDateText(BuildContext context) {
    if (_date.isToday) {
      return S.of(context).dateToday;
    } else if (_date.isTomorrow) {
      return S.of(context).dateTomorrow;
    } else if (_date.isYesterday) {
      return S.of(context).dateYesterday;
    } else {
      var formatStr = 'E, dd MMM';

      if (!_date.isCurrentYear) {
        formatStr = '$formatStr yyyy';
      }
      var format = DateFormat(formatStr);
      return format.format(_date);
    }
  }

  void load() async {
    model = await _interactor.getWorkoutList(_date);
    loading = false;
    notifyListeners();
  }
}
