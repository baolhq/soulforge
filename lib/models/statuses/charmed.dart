import 'package:flutter/material.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Charmed extends Status {
  Charmed()
      : super(
            name: "Charmed",
            description:
                "The entity is mentally influenced to see the caster as an ally. Prevents hostile actions against the caster.",
            statusTypeId: 3,
            savingThrowId: 1);

  @override
  void activate(Character target) {
    super.activate(target);

    // Charmed cannot be stacked
    target.statuses.removeWhere((status) => status is Charmed);
    target.statuses.add(this);
    debugPrint("${target.name} is now charmed.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer charmed.");
  }
}
