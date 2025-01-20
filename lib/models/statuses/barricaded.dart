import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Barricaded extends Status {
  Barricaded()
      : super(
            name: "Barricaded",
            description:
                "The entity is surrounded by a protective barrier that regenerates temporary hit points each turn.",
            savingThrow: SavingThrow.none,
            type: StatusType.buff);

  @override
  void activate(Character target) {
    super.activate(target);

    debugPrint("${target.name} is now barricaded.");
  }

  @override
  void update(Character target) {
    super.update(target);

    target.temporaryHealth = target.maxHealth * 0.1;
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer barricaded.");
  }
}
