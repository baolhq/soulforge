import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Poisoned extends Status {
  double damage = 0.025;
  double increment = 0.025;

  Poisoned()
      : super(
            name: "Poisoned",
            description:
                "The entity is afflicted by toxic substances, causing progressive health deterioration.",
            savingThrow: SavingThrow.intelligence,
            type: StatusType.debuff);

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
