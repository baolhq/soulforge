import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Raged extends Status {
  late double physicalIncrement;

  Raged()
      : super(
          name: "Raged",
          description:
              "The entity is overwhelmed by fury, enhancing their physical prowess but reducing control.",
          statusTypeId: 2,
        );

  @override
  void activate(Character target) {
    super.activate(target);

    //  Deal 50% more magic or elemental damage.
    physicalIncrement = target.attackDamageMultiplier * 0.5;
    target.attackDamageMultiplier += physicalIncrement;

    // Raged cannot be stacked
    target.statuses.removeWhere((status) => status is Raged);
    target.statuses.add(this);
    debugPrint("${target.name} is now raged.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore stats by subtracting back the increment.
    target.attackDamageMultiplier -= physicalIncrement;

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer raged.");
  }
}
