import 'package:flutter/material.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Fortified extends Status {
  late double incPhysicalRes;
  late double incMagicRes;
  late double incFireRes;
  late double incColdRes;
  late double incLightningRes;
  late double incPoisonRes;

  Fortified()
      : super(
          name: "Fortified",
          description:
              "The entity’s defenses are bolstered, making them more resilient to damage.",
          statusTypeId: 1,
        );

  @override
  void activate(Character target) {
    super.activate(target);

    // Increase resistances by 50% to all souces
    incPhysicalRes = target.physicalResistance * 0.5;
    incMagicRes = target.magicResistance * 0.5;
    incFireRes = target.fireResistance * 0.5;
    incColdRes = target.coldResistance * 0.5;
    incLightningRes = target.lightningResistance * 0.5;
    incPoisonRes = target.poisonResistance * 0.5;

    target.physicalResistance += incPhysicalRes;
    target.magicResistance += incMagicRes;
    target.fireResistance += incFireRes;
    target.coldResistance += incColdRes;
    target.lightningResistance += incLightningRes;
    target.poisonResistance += incPoisonRes;

    // Fortified cannot be stacked
    target.statuses.removeWhere((status) => status is Fortified);
    target.statuses.add(this);
    debugPrint("${target.name} is now fortified.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore resistances by subtracting back increased value
    target.physicalResistance -= incPhysicalRes;
    target.magicResistance -= incMagicRes;
    target.fireResistance -= incFireRes;
    target.coldResistance -= incColdRes;
    target.lightningResistance -= incLightningRes;
    target.poisonResistance -= incPoisonRes;

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer fortified.");
  }
}
