import 'package:flutter/material.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Blinded extends Status {
  late double critChanceReduction;
  late double evasionReduction;

  Blinded()
      : super(
            name: "Blinded",
            description:
                "The entity's vision is obscured, severely impacting their accuracy and alacrity.",
            statusTypeId: 3,
            savingThrowId: 1);

  @override
  void activate(Character target) {
    super.activate(target);

    // Calculate and apply reduction (50%)
    critChanceReduction = target.critChance / 2;
    evasionReduction = target.evasion / 2;

    target.critChance -= critChanceReduction;
    target.evasion -= evasionReduction;

    // Blinded cannot be stacked
    target.statuses.removeWhere((status) => status is Blinded);
    target.statuses.add(this);
    debugPrint("${target.name} is now blinded.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore old stat by adding back reductions
    target.critChance += critChanceReduction;
    target.evasion -= evasionReduction;

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer blinded.");
  }
}
