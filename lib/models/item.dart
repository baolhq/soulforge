import 'package:soulforge/enums/rarity.dart';
import 'package:uuid/uuid.dart';

class Item {
  late String id;
  String name = "";
  String description = "";
  int levelRequirement = 0;
  int maximumStack = 99;
  String iconPath = "";
  bool isQuestItem = false;
  bool isCollectable = true;
  bool canDrop = false;
  double dropRate = 1;
  Rarity rarity = Rarity.common;

  bool isCraftable = true;
  List<Item> craftingRecipe = List.empty(growable: true);

  String? ownerId;

  Item() {
    id = Uuid().v4();
  }
}
