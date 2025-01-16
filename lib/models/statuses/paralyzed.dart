import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Paralyzed extends Status {
  Paralyzed()
      : super(
            name: "Paralyzed",
            description:
                "The entity's body is immobilized, rendering them unable to move or act. Remove upon receiving damage.",
            savingThrow: SavingThrow.dexterity,
            type: StatusType.debuff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Paralyzed cannot be stacked
    target.statuses.removeWhere((status) => status is Paralyzed);
    target.statuses.add(this);
    debugPrint("${target.name} is now paralyzed.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer paralyzed.");
  }
}
