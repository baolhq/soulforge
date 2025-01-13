import 'package:soulforge/enums/skill_type.dart';
import 'package:soulforge/enums/status.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/skills/skill.dart';

class FlightSkill extends Skill {
  int flightDuration;

  FlightSkill({this.flightDuration = 3}) {
    name = "Flight";
    description =
        "Allows the character to fly over obstacles and avoid ground-based attacks.";
    energyCost = 10;
    duration = flightDuration;
    recharge = 5;
    type = SkillType.singleTarget;
    statuses.add(Status.flying);
  }

  @override
  void activateSingle(Character origin, Character target) {
    super.isRecharging = true;
    target.statuses.add(Status.flying);
  }

  @override
  void deactivateSingle(Character origin, Character target) {
    super.isRecharging = false;
    target.statuses.remove(Status.flying);
  }

  @override
  void updateSingle(Character origin, Character target) {
    if (duration > 0) {
      duration--;
    } else {
      deactivateSingle(origin, target);
    }
  }
}
