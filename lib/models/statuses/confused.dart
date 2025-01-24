import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Confused extends Status {
  Confused()
      : super(
            name: "Confused",
            description:
                "The entity is mentally disoriented, causing erratic behavior.",
            statusTypeId: 3,
            savingThrowId: 1);

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
