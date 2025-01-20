import 'package:soulforge/enums/quest_type.dart';
import 'package:uuid/uuid.dart';

class Quest {
  late String id;
  final String name;
  final String description;
  QuestType questType;
  late DateTime dueDate;
  bool isCompleted;
  bool isActive;
  bool isRepeatable;
  int progress;

  Quest(
      {required this.name,
      required this.description,
      this.questType = QuestType.story,
      this.isCompleted = false,
      this.isActive = false,
      this.isRepeatable = false,
      this.progress = 0}) {
    id = Uuid().v4();
    dueDate = DateTime(0);
  }
}
