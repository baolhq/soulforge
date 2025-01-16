import 'package:flutter/material.dart';
import 'package:soulforge/enums/class.dart';
import 'package:soulforge/models/entity.dart';
import 'package:soulforge/models/quest.dart';
import 'package:soulforge/models/statuses/fainted.dart';

class Character extends Entity {
  double expMultiplier;
  double experience;
  int gold;
  double discoveryRate;
  bool isRescued;
  List<Class> classes;
  List<Quest> quests;

  Character(
      {required super.name,
      required this.classes,
      required this.quests,
      this.expMultiplier = 1,
      this.experience = 0,
      this.gold = 0,
      this.discoveryRate = 1,
      this.isRescued = false});

  /// Implement the logic for the character's death.
  @override
  void die() {
    debugPrint("$name has died.");
  }

  /// Method for rescuing fainted ally
  void rescue(Character target) {
    if (target.isRescued) return;

    target.isRescued = true;
    var faintedStatus = target.statuses.firstWhere((s) => s is Fainted);
    target.statuses.remove(faintedStatus);
  }
}
