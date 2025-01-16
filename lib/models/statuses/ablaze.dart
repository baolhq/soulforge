import 'dart:math';

import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/burned.dart';
import 'package:soulforge/models/statuses/status.dart';

class Ablaze extends Status {
  Ablaze()
      : super(
            name: "Ablaze",
            description:
                "The creature is engulfed in flames, suffering intense fire damage over time. Have a chance to spead to nearby allies",
            savingThrow: SavingThrow.intelligence,
            type: StatusType.debuff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Ablaze cannot be stacked
    target.statuses.removeWhere((status) => status is Ablaze);
    target.statuses.add(this);
    debugPrint("${target.name} is now ablaze.");
  }

  @override
  void update(Character target) {
    super.update(target);

    _applyDamage(target);
    _spreadStatus(target);
  }

  void _applyDamage(Character target) {
    int damage = 5;
    target.takeDamage(5);
    debugPrint("${target.name} takes $damage fire damage from Ablaze!");
  }

  void _spreadStatus(Character target) {
    var random = Random();
    var adjacentCharacters = target.getAdjacentEntities();

    for (var adjCharacter in adjacentCharacters) {
      if (random.nextDouble() < 0.10) {
        adjCharacter.statuses.add(Burned());
        debugPrint("Ablaze spreads to ${adjCharacter.name}!");
      }
    }
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer ablaze.");
  }
}
