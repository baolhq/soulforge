import 'package:soulforge/enums/quest_type.dart';
import 'package:uuid/uuid.dart';

class Quest {
  late String id;
  final String name;
  final String description;
  QuestType type;
  DateTime? dueDate;
  bool isCompleted;
  bool isActive;
  bool isRepeatable;
  int progress;

  Quest(
      {required this.name,
      required this.description,
      this.type = QuestType.story,
      this.dueDate,
      this.isCompleted = false,
      this.isActive = false,
      this.isRepeatable = false,
      this.progress = 0}) {
    id = Uuid().v4();
  }
}
