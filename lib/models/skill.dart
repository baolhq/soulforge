import 'package:soulforge/enums/skill_type.dart';
import 'package:soulforge/enums/status.dart';
import 'package:uuid/uuid.dart';

class Skill {
  late String id;
  String name = "";
  String description = "";
  int energyCost = 0;
  double recharge = 0;
  bool isRecharging = false;
  bool isChargeable = false;
  bool isMultiTarget = false;
  bool isPiercing = false;
  SkillType type = SkillType.bonus;
  List<Status> statuses = List.empty();
  List<Skill> prerequisites = List.empty();

  Skill() {
    id = Uuid().v4();
  }
}
