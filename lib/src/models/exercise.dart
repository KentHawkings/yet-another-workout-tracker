import 'package:objectbox/objectbox.dart';
import 'package:yet_another_fitness_tracker/src/models/measurement.dart';
import 'package:yet_another_fitness_tracker/src/models/note.dart';
import 'package:yet_another_fitness_tracker/src/models/rep.dart';
import 'package:yet_another_fitness_tracker/src/utils/hash.dart';

@Entity()
class ExerciseType {
  /// Defines an exercise "category", in the context of weight lifting it will
  /// be the muscle group.
  int id = 0;

  @Unique()
  final String name;

  @Backlink('type')
  final exercises = ToMany<Exercise>();

  ExerciseType({id, name}) : name = name ?? '';

  @override
  int get hashCode => hash2(id, name);

  @override
  bool operator ==(Object other) {
    if (other is! ExerciseType) {
      return false;
    }
    return (other).id == id;
  }

  Exercise buildExercise(String name, MeasurementDimension dimension) {
    return Exercise(name: name)
      ..dimension.target = dimension
      ..type.target = this;
  }
}

@Entity()
class Exercise {
  int id = 0;

  /// The definition of an exercise, specifying it's name and it's "type"
  final String name;

  final type = ToOne<ExerciseType>();

  final dimension = ToOne<MeasurementDimension>();

  Exercise({name}) : name = name ?? '';

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! Exercise) {
      return false;
    }
    return (other).id == id;
  }
}

@Entity()
class ExerciseSet {
  int id = 0;

  MeasurementSystem measurementSystem;

  /// The definition of the exercise performed
  final exercise = ToOne<Exercise>();

  /// Additional user added notes
  final notes = ToMany<Note>();

  @Backlink('exerciseSet')
  final repGroups = ToMany<RepGroup>();

  @Property(type: PropertyType.date)
  DateTime? dateTime;

  ExerciseSet({measurementSystem, dateTime})
      : measurementSystem = measurementSystem ?? MeasurementSystem.metric,
        dateTime = dateTime ?? DateTime.now();

  int get dbMeasurementSystem => measurementSystem.id;

  set dbMeasurementSystem(int value) {
    if (value == MeasurementSystem.imperial.id) {
      measurementSystem = MeasurementSystem.imperial;
    } else {
      measurementSystem = MeasurementSystem.metric;
    }
  }
}
