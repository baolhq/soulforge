import 'package:soulforge/enums/gender.dart';
import 'package:soulforge/enums/status.dart';
import 'package:soulforge/models/magic.dart';
import 'package:uuid/uuid.dart';

class Entity {
  late String id;
  String name = "";
  int level = 1;
  int health = 100;
  int maxHealth = 100;
  int energy = 100;
  int maxEnergy = 100;
  Gender gender = Gender.unknown;
  String iconPath = "";
  String locationId = "";
  List<Magic> magics = List.empty(growable: true);
  List<Status> statuses = List.empty(growable: true);

  int strength = 1;
  int dexterity = 1;
  int intelligence = 1;
  int faith = 1;
  int constitution = 1;
  int charisma = 1;
  int luck = 1;

  double attackDamage = 1;
  double attackDamageMultiplier = 1;
  double attackRating = 1;
  double attackRatingMultiplier = 1;
  double magicDamageMultiplier = 1;
  double defense = 1;
  double critChance = 0.1;
  double evasion = 1;

  double physicalResistance = 0;
  double magicResistance = 0;
  double fireResistance = 0;
  double coldResistance = 0;
  double lightningResistance = 0;
  double poisonResistance = 0;

  Entity() {
    id = Uuid().v4();
  }
}
