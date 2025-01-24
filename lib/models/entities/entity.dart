import 'package:soulforge/models/entities/skill.dart';
import 'package:soulforge/models/statuses/status.dart';

abstract class Entity {
  int? id;
  final String name;
  int currentLevel;
  double health;
  double maxHealth;
  double temporaryHealth;
  double mana;
  double maxMana;
  int genderId;
  String? iconPath;
  int raceId;
  int locationId;
  late List<Skill> skills;
  late List<Status> statuses;

  int strength; // Affect overall melee damage
  int dexterity; // Affect ranged damage, initiative
  int intelligence; // Affect spell power, magic resistance
  int wisdom; // Affect status saving throw, enchantment
  int constitution; // Affect maxium HP and equipment load
  int charisma; // Affect status saving throw, barter rate
  int luck; // Affect evasion, critical hit chance

  double attackDamageMultiplier;
  double attackRating;
  double attackRatingMultiplier;
  double magicDamageMultiplier;
  double fireDamageMultiplier;
  double coldDamageMultiplier;
  double lightningDamageMultiplier;
  double poisonDamageMultiplier;
  double critChance;
  double evasion;

  double physicalResistance;
  double magicResistance;
  double fireResistance;
  double coldResistance;
  double lightningResistance;
  double poisonResistance;

  Entity(
      {required this.name,
      this.currentLevel = 1,
      this.health = 100,
      this.maxHealth = 100,
      this.temporaryHealth = 0,
      this.mana = 100,
      this.maxMana = 100,
      this.genderId = 1,
      this.iconPath = "",
      this.raceId = 1,
      this.locationId = 1,
      this.strength = 1,
      this.dexterity = 1,
      this.intelligence = 1,
      this.wisdom = 1,
      this.constitution = 1,
      this.charisma = 1,
      this.luck = 1,
      this.attackDamageMultiplier = 1,
      this.attackRating = 1,
      this.attackRatingMultiplier = 1,
      this.magicDamageMultiplier = 1,
      this.fireDamageMultiplier = 1,
      this.coldDamageMultiplier = 1,
      this.lightningDamageMultiplier = 1,
      this.poisonDamageMultiplier = 1,
      this.critChance = 0.1,
      this.evasion = 1,
      this.physicalResistance = 0,
      this.magicResistance = 0,
      this.fireResistance = 0,
      this.coldResistance = 0,
      this.lightningResistance = 0,
      this.poisonResistance = 0}) {
    skills = List.empty(growable: true);
    statuses = List.empty(growable: true);
  }

  void takeDamage(double damage) {
    if (health > 0) {
      health -= damage.round();
    } else {
      die();
    }
  }

  void die() {}
}
