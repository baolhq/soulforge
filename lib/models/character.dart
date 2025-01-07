import 'package:soulforge/enums/class.dart';
import 'package:soulforge/enums/race.dart';
import 'package:soulforge/models/entity.dart';
import 'package:soulforge/models/quest.dart';

class Character extends Entity {
  double expMultiplier = 1;
  int gold = 0;
  Race race = Race.human;
  List<Class> classes = List.empty(growable: true);
  List<Quest> quests = List.empty(growable: true);
}
