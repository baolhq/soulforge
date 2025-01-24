import 'package:flutter/material.dart';
import 'package:soulforge/models/entities/entity.dart';
import 'package:soulforge/models/items/item.dart';
import 'package:soulforge/models/npcs/vendor.dart';
import 'package:soulforge/models/statuses/fainted.dart';

class Character extends Entity {
  double expMultiplier;
  double experience;
  int gold;
  double discoveryRate;
  bool isFainted;
  bool isRescued;
  late List<Item> inventory;
  late List<int> classesId;

  Character(
      {required super.name,
      this.expMultiplier = 1.0,
      this.experience = 0.0,
      this.gold = 0,
      this.discoveryRate = 100.0,
      this.isFainted = false,
      this.isRescued = false}) {
    inventory = List.empty(growable: true);
    classesId = List.empty(growable: true);
  }

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

  void bribe(Vendor vendor, int amount) {
    if (gold - amount < 0) {
      debugPrint("You don't have enough gold");
    }

    vendor.bribe(amount);
    gold -= amount;
    debugPrint("$name bribes ${vendor.name} for $amount gold");
  }
}
