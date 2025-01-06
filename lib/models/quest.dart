import 'package:soulforge/enums/quest_type.dart';
import 'package:uuid/uuid.dart';

class Quest {
  late String id;
  String name = "";
  String description = "";
  QuestType type = QuestType.story;
  DateTime dueDate = DateTime.now();
  bool isCompleted = false;
  bool isActive = false;
  bool isRepeatable = false;
  int progress = 0;

  Quest() {
    id = Uuid().v4();
  }
}
