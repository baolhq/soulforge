import 'package:soulforge/enums/gender.dart';
import 'package:soulforge/enums/race.dart';
import 'package:soulforge/models/magic.dart';
import 'package:soulforge/models/skill.dart';
import 'package:soulforge/models/statuses/status.dart';
import 'package:uuid/uuid.dart';

abstract class Entity {
  late String id;
  final String name;
  int level;
  int health;
  int maxHealth;
  int temporaryHealth;
  int mana;
  int maxMana;
  Race race;
  Gender gender;
  String iconPath;
  String locationId;
  late List<Skill> skills;
  late List<Magic> magics;
  late List<Status> statuses;

  int strength; // Affect overall melee damage
  int dexterity; // Affect ranged damage, initiative
  int intelligence; // Affect spell power, magic resistance
  int wisdom; // Affect status saving throw, enchantment
  int constitution; // Affect maxium HP and equipment load
  int charisma; // Affect status saving throw, barter rate
  int luck; // Affect evasion, critical hit chance

  double attackDamage;
  double attackDamageMultiplier;
  double attackRating;
  double attackRatingMultiplier;
  double magicDamageMultiplier;
  double fireDamageMultiplier;
  double coldDamageMultiplier;
  double lightningDamageMultiplier;
  double poisonDamageMultiplier;
  double defense;
  double critChance;
  double evasion;
  int initiative;

  double physicalResistance;
  double magicResistance;
  double fireResistance;
  double coldResistance;
  double lightningResistance;
  double poisonResistance;

  int row;
  int col;
  late List<List<Entity>> partyGrid;

  Entity(
      {required this.name,
      this.level = 1,
      this.health = 100,
      this.maxHealth = 100,
      this.temporaryHealth = 0,
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
      this.fireDamageMultiplier = 1,
      this.coldDamageMultiplier = 1,
      this.lightningDamageMultiplier = 1,
      this.poisonDamageMultiplier = 1,
      this.defense = 1,
      this.critChance = 0.1,
      this.evasion = 1,
      this.initiative = 0,
      this.physicalResistance = 0,
      this.magicResistance = 0,
      this.fireResistance = 0,
      this.coldResistance = 0,
      this.lightningResistance = 0,
      this.poisonResistance = 0,
      this.row = 0,
      this.col = 0}) {
    id = Uuid().v4();
    skills = List.empty(growable: true);
    magics = List.empty(growable: true);
    statuses = List.empty(growable: true);
    partyGrid = List.empty(growable: true);
  }

  void takeDamage(double damage) {
    if (health > 0) {
      health -= damage.round();
    } else {
      die();
    }
  }

  void die() {}

  List<Entity> getAdjacentEntities() {
    List<Entity> adjacentEntities = [];
    var adjacentOffset = [
      [-1, 0], // Above
      [1, 0], // Below
      [0, -1], // Left
      [0, 1], // Right
    ];

    for (var offset in adjacentOffset) {
      int newRow = row + offset[0];
      int newCol = col + offset[1];

      // Check if the new position is within the grid bounds
      if (newRow >= 0 &&
          newRow < partyGrid.length &&
          newCol >= 0 &&
          newCol < partyGrid[0].length) {
        var adjacentEntity = partyGrid[newRow][newCol];
        adjacentEntities.add(adjacentEntity);
      }
    }

    return adjacentEntities;
  }
}
