import 'package:soulforge/enums/rarity.dart';
import 'package:uuid/uuid.dart';

class Item {
  late String id;
  final String name;
  final String description;
  int levelRequirement;
  int maximumStack;
  String iconPath;
  bool isQuestItem;
  bool isCollectable;
  bool canDrop;
  double dropRate;
  Rarity rarity;
  String ownerId;
  final bool isCraftable;
  late final List<Item> craftingRecipe;

  Item(
      {required this.name,
      required this.description,
      required this.isCraftable,
      required this.craftingRecipe,
      this.levelRequirement = 0,
      this.maximumStack = 99,
      this.iconPath = "",
      this.isQuestItem = false,
      this.isCollectable = true,
      this.canDrop = false,
      this.dropRate = 1,
      this.rarity = Rarity.common,
      this.ownerId = ""}) {
    id = Uuid().v4();
  }
}
