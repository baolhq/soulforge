import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Petrified extends Status {
  Petrified()
      : super(
            name: "Petrified",
            description:
                "The entity is turned to stone, completely immobilizing them and halting any actions.",
            savingThrow: SavingThrow.charisma,
            type: StatusType.debuff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Petrified cannot be stacked
    target.statuses.removeWhere((status) => status is Petrified);
    target.statuses.add(this);
    debugPrint("${target.name} is now petrified.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer petrified.");
  }
}
