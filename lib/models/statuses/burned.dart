import 'package:flutter/material.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Burned extends Status {
  Burned()
      : super(
            name: "Burned",
            description:
                "The entity is scorched, taking heat damage over time.",
            statusTypeId: 3,
            savingThrowId: 1);

  @override
  void update(Character target) {
    super.update(target);

    target.takeDamage(target.maxHealth * 0.05);
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer burned.");
  }
}
