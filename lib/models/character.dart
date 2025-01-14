import 'package:soulforge/enums/class.dart';
import 'package:soulforge/models/entity.dart';
import 'package:soulforge/models/quest.dart';

class Character extends Entity {
  double expMultiplier;
  double experience;
  int gold;
  List<Class> classes;
  List<Quest> quests;

  Character(
      {required super.name,
      required this.classes,
      required this.quests,
      this.expMultiplier = 1,
      this.experience = 0,
      this.gold = 0});
}
