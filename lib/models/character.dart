import 'package:soulforge/enums/character_class.dart';
import 'package:soulforge/models/entity.dart';
import 'package:soulforge/models/quest.dart';

class Character extends Entity {
  double expMultiplier = 1;
  List<CharacterClass> classes = List.empty();
  List<Quest> quests = List.empty();
}
