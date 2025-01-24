import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Frozen extends Status {
  Frozen()
      : super(
            name: "Frozen",
            description:
                "The entity is encased in ice, limiting their movement and actions. Can be defrosted with fire damage.",
            statusTypeId: 3,
            savingThrowId: 1);

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
