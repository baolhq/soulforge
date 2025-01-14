import 'package:soulforge/models/item.dart';

class Armor extends Item {
  double weight;
  double durability;
  int upgradeLevel;

  double physicalResistance;
  double magicResistance;
  double fireResistance;
  double coldResistance;
  double lightningResistance;
  double poisonResistance;

  Armor(
      {required super.name,
      required super.description,
      required super.isCraftable,
      required super.craftingRecipe,
      this.weight = 1,
      this.durability = 100,
      this.upgradeLevel = 0,
      this.physicalResistance = 0,
      this.magicResistance = 0,
      this.fireResistance = 0,
      this.coldResistance = 0,
      this.lightningResistance = 0,
      this.poisonResistance = 0});
}
