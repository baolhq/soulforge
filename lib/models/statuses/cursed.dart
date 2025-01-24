import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Cursed extends Status {
  late int strengthReduction;
  late int dexterityReduction;
  late int intelligenceReduction;
  late int wisdomReduction;
  late int constitutionReduction;
  late int luckReduction;

  Cursed()
      : super(
            name: "Cursed",
            description:
                "A dark affliction weakens the entity’s abilities or increases their vulnerability.",
            statusTypeId: 3,
            savingThrowId: 1);

  @override
  void activate(Character target) {
    super.activate(target);

    // Calculate and apply reductions (10% reduction)
    strengthReduction = (target.strength * 0.1).round();
    dexterityReduction = (target.dexterity * 0.1).round();
    intelligenceReduction = (target.intelligence * 0.1).round();
    wisdomReduction = (target.wisdom * 0.1).round();
    constitutionReduction = (target.constitution * 0.1).round();
    luckReduction = (target.luck * 0.1).round();

    target.strength -= strengthReduction;
    target.dexterity -= dexterityReduction;
    target.intelligence -= intelligenceReduction;
    target.wisdom -= wisdomReduction;
    target.constitution -= constitutionReduction;
    target.luck -= luckReduction;

    // Cursed cannot be stacked
    target.statuses.removeWhere((status) => status is Cursed);
    target.statuses.add(this);
    debugPrint("${target.name} is now cursed.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore stats by adding back the reductions
    target.strength += strengthReduction;
    target.dexterity += dexterityReduction;
    target.intelligence += intelligenceReduction;
    target.wisdom += wisdomReduction;
    target.constitution += constitutionReduction;
    target.luck += luckReduction;

    target.statuses.remove(this);
    debugPrint("${target.name}'s curse is lifted, restoring their stats.");
  }
}
