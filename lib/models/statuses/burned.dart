import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Burned extends Status {
  Burned()
      : super(
            name: "Burned",
            description:
                "The entity is scorched, taking heat damage over time.",
            savingThrow: SavingThrow.intelligence,
            type: StatusType.debuff);

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
