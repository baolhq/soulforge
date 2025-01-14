import 'package:flutter/material.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

const faintedDuration = 3;

class FaintedStatus extends Status {
  FaintedStatus()
      : super(
            name: "Fainted",
            description:
                "The character has fainted and will die after 3 turns unless rescued.",
            modifiers: [],
            type: StatusType.debuff,
            duration: faintedDuration);

  @override
  void activate(Character target) {
    super.activate(target);

    // Remove all other statuses before fainting
    target.statuses.clear();
    target.statuses.add(FaintedStatus());
  }

  @override
  void update(Character target) {
    super.update(target);
    if (duration <= 0) {
      if (!target.isRescued) {
        target.die();
      }
    }
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);
    debugPrint("$name fainted status has been removed");
  }
}
