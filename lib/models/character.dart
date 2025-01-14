import 'package:soulforge/enums/class.dart';
import 'package:soulforge/models/entity.dart';
import 'package:soulforge/models/quest.dart';

class Character extends Entity {
  double expMultiplier;
  double experience;
  int gold;
  late List<Class> classes;
  late List<Quest> quests;

  Character(
      {required super.name,
      this.expMultiplier = 1,
      this.experience = 0,
      this.gold = 0}) {
    classes = List.empty(growable: true);
    quests = List.empty(growable: true);
  }
}
