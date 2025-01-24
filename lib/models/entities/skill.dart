import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Skill {
  final int? id;
  final String name;
  final String? description;
  int manaCost;
  int? duration;
  double? accuracy;
  int? recharge;
  bool isRecharging;
  bool isChargeable;
  bool isMultiTarget;
  bool isPiercing;
  int skillTypeId;
  late List<Status> statuses;
  late List<Skill> prerequisites;

  Skill(
      {required this.name,
      this.id,
      this.description,
      this.manaCost = 0,
      this.duration,
      this.accuracy,
      this.recharge,
      this.isRecharging = false,
      this.isChargeable = false,
      this.isMultiTarget = false,
      this.isPiercing = false,
      this.skillTypeId = 1}) {
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
