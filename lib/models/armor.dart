import 'package:soulforge/models/item.dart';

class Armor extends Item {
  double weight = 1;
  double durability = 100;
  int upgradeLevel = 0;

  double physicalResistance = 0;
  double magicResistance = 0;
  double fireResistance = 0;
  double coldResistance = 0;
  double lightningResistance = 0;
  double poisonResistance = 0;
}
