import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

const faintedDuration = 3;

class Fainted extends Status {
  Fainted()
      : super(
            name: "Fainted",
            description:
                "The character has fainted and will die after 3 turns unless rescued.",
            statusTypeId: 3,
            savingThrowId: 1,
            duration: faintedDuration);

  @override
  void activate(Character target) {
    super.activate(target);

    // Fainted cannot be stacked
    target.statuses.removeWhere((status) => status is Fainted);
    target.statuses.add(this);
    debugPrint("${target.name} is now fainted.");
  }

  @override
  void update(Character target) {
    super.update(target);

    if (duration! <= 0) {
      if (!target.isRescued) {
        target.die();
      }
    }
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("$name fainted status has been removed");
  }
}
