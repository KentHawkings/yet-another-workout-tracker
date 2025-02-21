import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  int id = 0;

  /// User given notes that can be applied to an Exercise or Workout
  String content;

  Note({content}) : content = content ?? '';
}
