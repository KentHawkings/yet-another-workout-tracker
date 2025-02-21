import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';

class HomeViewModel extends ViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool _showFab = true;

  bool get showFab => _showFab;

  void setCurrentIndex(int value) {
    _currentIndex = value;
    _showFab = currentIndex == 0;
    notifyListeners();
  }
}
