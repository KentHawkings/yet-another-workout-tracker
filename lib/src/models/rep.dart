import 'package:objectbox/objectbox.dart';
import 'package:yet_another_fitness_tracker/src/models/exercise.dart';

@Entity()
class RepGroup {
  int id = 0;

  final repType = ToOne<RepType>();

  final exerciseSet = ToOne<ExerciseSet>();

  /// Keeps track of the metrics defined by the exercise's measure dimensions
  final List<String> values;

  RepGroup(this.values);

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! RepGroup) {
      return false;
    }
    return (other).id == id;
  }
}

@Entity()
class RepType {
  static const repTypeFullId = 1;

  int id = 0;

  @Unique()
  String name;

  RepType({id, name}) : name = name ?? '';

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! RepType) {
      return false;
    }
    return (other).id == id;
  }
}
