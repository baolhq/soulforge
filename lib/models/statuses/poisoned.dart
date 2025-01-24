import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Poisoned extends Status {
  double damage = 0.025;
  double increment = 0.025;

  Poisoned()
      : super(
            name: "Poisoned",
            description:
                "The entity is afflicted by toxic substances, causing progressive health deterioration.",
            statusTypeId: 3,
            savingThrowId: 1);

  @override
  void update(Character target) {
    super.update(target);

    target.takeDamage(damage);
    damage += increment;

    debugPrint("${target.name} poison damage has been increased to $damage");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer poisoned.");
  }
}
