import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Confused extends Status {
  Confused()
      : super(
            name: "Confused",
            description:
                "The entity is mentally disoriented, causing erratic behavior.",
            savingThrow: SavingThrow.wisdom,
            type: StatusType.debuff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Confused cannot be stacked
    target.statuses.removeWhere((status) => status is Confused);
    target.statuses.add(this);
    debugPrint("${target.name} is now confused.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer confused.");
  }
}
