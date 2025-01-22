import 'package:flutter/material.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Overcharged extends Status {
  late double magicIncrement;
  late double fireIncrement;
  late double coldIncrement;
  late double lightningIncrement;
  late double poisonIncrement;

  Overcharged()
      : super(
          name: "Overcharged",
          description: "The entity’s magical energy is amplified with a cost",
          statusTypeId: 2,
        );

  @override
  void activate(Character target) {
    super.activate(target);

    //  Deal 50% more magic or elemental damage.
    magicIncrement = target.magicDamageMultiplier * 0.5;
    fireIncrement = target.fireDamageMultiplier * 0.5;
    coldIncrement = target.coldDamageMultiplier * 0.5;
    lightningIncrement = target.lightningDamageMultiplier * 0.5;
    poisonIncrement = target.poisonDamageMultiplier * 0.5;

    target.magicDamageMultiplier += magicIncrement;
    target.fireDamageMultiplier += fireIncrement;
    target.coldDamageMultiplier += coldIncrement;
    target.lightningDamageMultiplier += lightningIncrement;
    target.poisonDamageMultiplier += poisonIncrement;

    // Overcharge cannot be stacked
    target.statuses.removeWhere((status) => status is Overcharged);
    target.statuses.add(this);
    debugPrint("${target.name} is now overcharged.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore stats by subtracting back the increment.
    target.magicDamageMultiplier -= magicIncrement;
    target.fireDamageMultiplier -= fireIncrement;
    target.coldDamageMultiplier -= coldIncrement;
    target.lightningDamageMultiplier -= lightningIncrement;
    target.poisonDamageMultiplier -= poisonIncrement;

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer overcharged.");
  }
}
