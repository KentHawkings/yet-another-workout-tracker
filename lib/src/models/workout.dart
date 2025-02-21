import 'package:objectbox/objectbox.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';
import 'package:yet_another_fitness_tracker/src/models/note.dart';

@Entity()
class Workout {
  /// A Workout represents a series of exercises completed on a particular day
  int id = 0;

  final exercises = ToMany<ExerciseSet>();

  final notes = ToMany<Note>();

  @Property(type: PropertyType.date)
  DateTime? date;

  Workout({this.date});
}
