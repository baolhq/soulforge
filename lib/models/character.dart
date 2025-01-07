import 'package:soulforge/enums/class.dart';
import 'package:soulforge/enums/character_race.dart';
import 'package:soulforge/models/entity.dart';
import 'package:soulforge/models/quest.dart';

class Character extends Entity {
  double expMultiplier = 1;
  int gold = 0;
  CharacterRace race = CharacterRace.human;
  List<Class> classes = List.empty(growable: true);
  List<Quest> quests = List.empty(growable: true);
}
