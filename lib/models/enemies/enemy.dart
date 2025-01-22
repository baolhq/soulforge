import 'package:flutter/material.dart';
import 'package:soulforge/models/entity.dart';

class Enemy extends Entity {
  final String? description;
  double experience;
  int gold;
  int treasureClassId;

  Enemy(
      {required super.name,
      this.description,
      this.experience = 1.0,
      this.gold = 1,
      this.treasureClassId = 1});

  /// Implement logic for enemy on slain
  @override
  void die() {
    debugPrint("$name has died.");
  }
}
