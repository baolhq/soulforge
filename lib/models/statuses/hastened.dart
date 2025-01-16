import 'package:flutter/material.dart';
import 'package:soulforge/enums/saving_throw.dart';
import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Hastened extends Status {
  int initiativeInc = 5;
  int rechargeDec = 1;

  Hastened()
      : super(
            name: "Hastened",
            description: "The entity’s speed and reaction times are enhanced.",
            savingThrow: SavingThrow.none,
            type: StatusType.buff);

  @override
  void activate(Character target) {
    super.activate(target);

    // Increase ininiative by 5 and reduce skill and magic cooldowns by 1
    target.initiative += initiativeInc;
    for (var skill in target.skills) {
      skill.recharge -= rechargeDec;
    }
    for (var magic in target.magics) {
      magic.recharge -= rechargeDec;
    }

    // Hastened cannot be stacked
    target.statuses.removeWhere((status) => status is Hastened);
    target.statuses.add(this);
    debugPrint("${target.name} is now hastened.");
  }

  @override
  void deactivate(Character target) {
    super.deactivate(target);

    // Restore initiative and recharge cooldowns
    target.initiative -= initiativeInc;
    for (var skill in target.skills) {
      skill.recharge += rechargeDec;
    }
    for (var magic in target.magics) {
      magic.recharge += rechargeDec;
    }

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer hastened.");
  }
}
