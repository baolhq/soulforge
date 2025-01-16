import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Bleeding extends Status {
  late double physcalReduction;

  Bleeding()
      : super(
            name: "Bleeding",
            description:
                "The entity suffers continuous damage over time due to open wounds. Becomes vulnerable to physical damage.",
            savingThrow: SavingThrow.wisdom,
            type: StatusType.debuff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Store the original physical resistance
    physcalReduction = target.physicalResistance / 2;
    target.physicalResistance -= physcalReduction;
  }

  @override
  void update(Character target) {
    super.update(target);

    // Inflict 5% of max health as damage
    target.takeDamage((target.maxHealth * 0.05));
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore physical resistance by adding back the reduction
    target.physicalResistance += physcalReduction;

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer bleeding.");
  }
}
