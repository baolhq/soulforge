import 'package:soulforge/models/item.dart';

class Consumable extends Item {
  int usageLeft = 1;
  int healthRestoration = 0;
  int manaRestoration = 0;

  Consumable(
      {required super.name,
      required super.isCraftable,
      required super.craftingRecipe,
      this.usageLeft = 1,
      this.healthRestoration = 0,
      this.manaRestoration = 0});
}
