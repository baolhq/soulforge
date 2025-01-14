import 'package:soulforge/enums/weapon_type.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/magic.dart';
import 'package:soulforge/models/skill.dart';
import 'package:soulforge/models/status.dart';

class Weapon extends Item {
  double weight;
  double damageMultiplier;
  double attackRatingMultiplier;
  int upgradeLevel;
  final WeaponType type;
  late List<Status> statuses;
  late List<Skill> skills;
  late List<Magic> magics;

  Weapon({
    required super.name,
    required super.description,
    required super.isCraftable,
    required super.craftingRecipe,
    required this.type,
    this.weight = 1,
    this.damageMultiplier = 1,
    this.attackRatingMultiplier = 1,
    this.upgradeLevel = 0,
  }) {
    statuses = List.empty(growable: true);
    skills = List.empty(growable: true);
    magics = List.empty(growable: true);
  }
}
