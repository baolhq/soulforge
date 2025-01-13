import 'package:soulforge/enums/skill_type.dart';
import 'package:soulforge/enums/status.dart';
import 'package:soulforge/models/character.dart';
import 'package:uuid/uuid.dart';

class Skill {
  late String id;
  String name = "";
  String description = "";
  int energyCost = 0;
  int duration = 1;
  int recharge = 0;
  bool isRecharging = false;
  bool isChargeable = false;
  bool isMultiTarget = false;
  bool isPiercing = false;
  SkillType type = SkillType.singleTarget;
  List<Status> statuses = List.empty(growable: true);
  List<Skill> prerequisites = List.empty(growable: true);

  Skill() {
    id = Uuid().v4();
  }

  void activateSingle(Character origin, Character target) {}
  void deactivateSingle(Character origin, Character target) {}
  void updateSingle(Character origin, Character target) {}

  void activateMultiple(Character origin, List<Character> targets) {}
  void deactivateMultiple(Character origin, List<Character> targets) {}
  void updateMultiple(Character origin, List<Character> targets) {}
}
