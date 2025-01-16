import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Enlightened extends Status {
  late double increasedRate;

  Enlightened()
      : super(
            name: "Enlightened",
            description:
                "The entity is surrounded by a protective barrier that regenerates temporary hit points each turn.",
            savingThrow: SavingThrow.none,
            type: StatusType.buff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Increase item discovery rate by 20%
    increasedRate = target.discoveryRate * 0.2;
    target.discoveryRate += increasedRate;

    // Enlightened cannot be stacked
    target.statuses.removeWhere((status) => status is Enlightened);
    target.statuses.add(this);
    debugPrint("${target.name} is now enlightened.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore item discovery rate
    target.discoveryRate -= increasedRate;

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer enlightened.");
  }
}
