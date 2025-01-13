import 'package:soulforge/enums/skill_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/skills/skill.dart';

class InfernalClaw extends Skill {
  InfernalClaw() {
    name = "Infernal Claw";
    description =
        "Attack the target with both claws, deal additional fire damage.";
    energyCost = 5;
    recharge = 2;
    type = SkillType.singleTarget;
  }

  @override
  void activateSingle(Character origin, Character target) {
    super.isRecharging = true;
    target.takeDamage(origin.attackDamage *
        origin.attackDamageMultiplier *
        (origin.dexterity / 100));
  }
}
