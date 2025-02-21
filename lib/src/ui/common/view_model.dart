import 'package:flutter/widgets.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/loadable.dart';

abstract class ViewModel extends ChangeNotifier {}

abstract class LoadableViewModel extends ViewModel with Loadable {}

abstract class InteractorViewModel<I extends Object> extends LoadableViewModel {
  final I interactor;

  InteractorViewModel(BuildContext context, this.interactor);
}
