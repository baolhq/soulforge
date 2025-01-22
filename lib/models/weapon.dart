import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/skill.dart';
import 'package:soulforge/models/statuses/status.dart';

class Weapon extends Item {
  double damageMultiplier;
  double attackRatingMultiplier;
  double critChance;
  double minDamage;
  double maxDamage;
  double baseUpgradePrice;
  int upgradeLevel;
  final int weaponTypeId;
  late List<Status> statuses;
  late List<Skill> skills;

  Weapon({
    required super.name,
    required super.description,
    required super.basePrice,
    required this.baseUpgradePrice,
    this.damageMultiplier = 1.0,
    this.attackRatingMultiplier = 1.0,
    this.critChance = 0.0,
    this.minDamage = 1.0,
    this.maxDamage = 1.0,
    this.upgradeLevel = 0,
    this.weaponTypeId = 1,
  }) {
    statuses = List.empty(growable: true);
    skills = List.empty(growable: true);
  }
}
