import 'package:flutter/material.dart';
import 'package:soulforge/models/entity.dart';

class Enemy extends Entity {
  final String description;
  int experience;
  int gold;
  String treasureClassId;

  Enemy(
      {required super.name,
      required this.description,
      this.experience = 1,
      this.gold = 1,
      this.treasureClassId = ""});

  /// Implement logic for enemy on slain
  @override
  void die() {
    debugPrint("$name has died.");
  }
}
