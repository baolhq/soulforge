import 'package:flutter/material.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Stunned extends Status {
  Stunned()
      : super(
            name: "Stunned",
            description:
                "A sudden shock disrupts the entity's senses, momentarily incapacitating them.",
            statusTypeId: 3,
            savingThrowId: 1);

  @override
  void activate(Character target) {
    super.activate(target);

    // Stunned cannot be stacked
    target.statuses.removeWhere((status) => status is Stunned);
    target.statuses.add(this);
    debugPrint("${target.name} is now stunned.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer stunned.");
  }
}
