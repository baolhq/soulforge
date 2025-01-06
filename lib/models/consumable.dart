import 'package:soulforge/models/item.dart';

class Consumable extends Item {
  int usageLeft = 1;
  int healthRestoration = 0;
  int energyRestoration = 0;
}
