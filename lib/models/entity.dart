import 'package:soulforge/enums/gender.dart';
import 'package:soulforge/enums/race.dart';
import 'package:soulforge/models/magic.dart';
import 'package:soulforge/models/skill.dart';
import 'package:soulforge/models/status.dart';
import 'package:uuid/uuid.dart';

abstract class Entity {
  late String id;
  final String name;
  int level;
  int health;
  int maxHealth;
  int mana;
  int maxMana;
  Race race;
  Gender gender;
  String iconPath;
  String locationId;
  late List<Skill> skills;
  late List<Magic> magics;
  late List<Status> statuses;

  int strength;
  int dexterity;
  int intelligence;
  int wisdom;
  int constitution;
  int charisma;
  int luck;

  double attackDamage;
  double attackDamageMultiplier;
  double attackRating;
  double attackRatingMultiplier;
  double magicDamageMultiplier;
  double defense;
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
      this.level = 1,
      this.health = 100,
      this.maxHealth = 100,
      this.mana = 100,
      this.maxMana = 100,
      this.race = Race.human,
      this.gender = Gender.unknown,
      this.iconPath = "",
      this.locationId = "",
      this.strength = 1,
      this.dexterity = 1,
      this.intelligence = 1,
      this.wisdom = 1,
      this.constitution = 1,
      this.charisma = 1,
      this.luck = 1,
      this.attackDamage = 1,
      this.attackDamageMultiplier = 1,
      this.attackRating = 1,
      this.attackRatingMultiplier = 1,
      this.magicDamageMultiplier = 1,
      this.defense = 1,
      this.critChance = 0.1,
      this.evasion = 1,
      this.physicalResistance = 0,
      this.magicResistance = 0,
      this.fireResistance = 0,
      this.coldResistance = 0,
      this.lightningResistance = 0,
      this.poisonResistance = 0}) {
    id = Uuid().v4();
    skills = List.empty(growable: true);
    magics = List.empty(growable: true);
    statuses = List.empty(growable: true);
  }

  void takeDamage(double damage) {
    if (health > 0) {
      health -= damage.round();
    }
  }
}
