import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Etheral extends Status {
  late double physicalDamage;
  late double magicDamage;
  late double takenPhysicalIncrement;
  late double takenMagicIncrement;

  Etheral()
      : super(
            name: "Etheral",
            description:
                "The entity temporarily shifts into a semi-intangible state.",
            savingThrow: SavingThrow.none,
            type: StatusType.neutral);

  @override
  void activate(Character target) {
    super.activate(target);

    // Take 50% less damage, deal 25% less damage
    takenPhysicalIncrement = target.physicalResistance * 0.5;
    takenMagicIncrement = target.magicResistance * 0.5;
    physicalDamage = target.attackDamageMultiplier * 0.25;
    magicDamage = target.magicDamageMultiplier * 0.25;

    target.physicalResistance += takenMagicIncrement;
    target.magicResistance += takenMagicIncrement;
    target.attackDamageMultiplier -= physicalDamage;
    target.magicDamageMultiplier -= magicDamage;

    // Etheral cannot be stacked
    target.statuses.removeWhere((status) => status is Etheral);
    target.statuses.add(this);
    debugPrint("${target.name} is now etheral.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore stats by adding back the reductions
    target.physicalResistance -= takenMagicIncrement;
    target.magicResistance -= takenMagicIncrement;
    target.attackDamageMultiplier += physicalDamage;
    target.magicDamageMultiplier += magicDamage;

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer etheral.");
  }
}
