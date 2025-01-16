import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Frozen extends Status {
  Frozen()
      : super(
            name: "Frozen",
            description:
                "The entity is encased in ice, limiting their movement and actions. Can be defrosted with fire damage.",
            savingThrow: SavingThrow.strength,
            type: StatusType.debuff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Frozen cannot be stacked
    target.statuses.removeWhere((status) => status is Frozen);
    target.statuses.add(this);
    debugPrint("${target.name} is now frozen.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer frozen.");
  }
}
