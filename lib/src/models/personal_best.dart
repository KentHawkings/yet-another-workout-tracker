import 'package:objectbox/objectbox.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';

@Entity()
class PersonalBest {
  /// Represents a personal best for a specific ExerciseDefinition
  int id = 0;

  final exerciseDefinition = ToOne<Exercise>();
}
