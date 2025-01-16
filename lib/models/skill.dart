import 'package:soulforge/enums/skill_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';
import 'package:uuid/uuid.dart';

class Skill {
  late String id;
  final String name;
  final String description;
  int manaCost;
  int duration;
  double accuracy;
  int recharge;
  bool isRecharging;
  bool isChargeable;
  bool isMultiTarget;
  bool isPiercing;
  SkillType type;
  late List<Status> statuses;
  late List<Skill> prerequisites;

  Skill(
      {required this.name,
      required this.description,
      this.manaCost = 0,
      this.duration = 0,
      this.accuracy = 100,
      this.recharge = 0,
      this.isRecharging = false,
      this.isChargeable = false,
      this.isMultiTarget = false,
      this.isPiercing = false,
      this.type = SkillType.singleTarget}) {
    id = Uuid().v4();
    statuses = List.empty(growable: true);
    prerequisites = List.empty(growable: true);
  }

  void activateSingle(Character origin, Character target) {}
  void deactivateSingle(Character origin, Character target) {}
  void updateSingle(Character origin, Character target) {}

  void activateMultiple(Character origin, List<Character> targets) {}
  void deactivateMultiple(Character origin, List<Character> targets) {}
  void updateMultiple(Character origin, List<Character> targets) {}
}
