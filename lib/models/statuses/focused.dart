import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Focused extends Status {
  late double increasedCritChance;
  late List<double> increasedSkillAccuracy;
  late List<double> increasedMagicAccuracy;

  Focused()
      : super(
            name: "Focused",
            description:
                "The entity’s concentration is heightened, improving accuracy and precision. 25% chance to lose upon taking damage.",
            savingThrow: SavingThrow.none,
            type: StatusType.buff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Increase accuracy and precision by 25%
    increasedCritChance = target.critChance * 0.25;
    target.critChance += increasedCritChance;

    increasedSkillAccuracy = target.skills.map((skill) {
      var increase = skill.accuracy * 0.25;
      skill.accuracy += increase;
      return increase;
    }).toList();

    increasedMagicAccuracy = target.magics.map((magic) {
      var increase = magic.accuracy * 0.25;
      magic.accuracy += increase;
      return increase;
    }).toList();

    // Focused cannot be stacked
    target.statuses.removeWhere((status) => status is Focused);
    target.statuses.add(this);
    debugPrint("${target.name} is now focused.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore accuracy and precision by subtracting back increased value
    target.critChance -= increasedCritChance;
    target.skills.asMap().forEach((i, skill) {
      skill.accuracy -= increasedSkillAccuracy[i];
    });
    target.magics.asMap().forEach((i, magic) {
      magic.accuracy -= increasedMagicAccuracy[i];
    });

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer focused.");
  }
}
