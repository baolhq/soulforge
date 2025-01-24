import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/statuses/status.dart';

class Hastened extends Status {
  int rechargeDec = 1;

  Hastened()
      : super(
          name: "Hastened",
          description: "The entity’s speed and reaction times are enhanced.",
          statusTypeId: 1,
        );

  @override
  void activate(Character target) {
    super.activate(target);

    // Increase ininiative by 5 and reduce skill and magic cooldowns by 1
    for (var skill in target.skills) {
      if (skill.recharge != null) {
        var recharge = skill.recharge!;
        skill.recharge = recharge - rechargeDec;
      }
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
    for (var skill in target.skills) {
      if (skill.recharge != null) {
        var recharge = skill.recharge!;
        skill.recharge = recharge + rechargeDec;
      }
    }

    target.statuses.remove(this);
    debugPrint("${target.name} is no longer hastened.");
  }
}
