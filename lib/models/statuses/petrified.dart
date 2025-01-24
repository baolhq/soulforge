import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Petrified extends Status {
  Petrified()
      : super(
            name: "Petrified",
            description:
                "The entity is turned to stone, completely immobilizing them and halting any actions.",
            statusTypeId: 3,
            savingThrowId: 1);

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
