import 'package:soulforge/enums/rarity.dart';
import 'package:uuid/uuid.dart';

class Item {
  late String id;
  final String name;
  final String description;
  int levelRequirement;
  int maximumStack;
  double basePrice;
  String iconPath;
  bool isQuestItem;
  bool isCollectable;
  bool canDrop;
  double dropRate;
  Rarity rarity;
  String ownerId;
  bool isCraftable;
  late List<Item> craftingRecipe;

  Item({
    required this.name,
    required this.description,
    required this.basePrice,
    this.levelRequirement = 0,
    this.maximumStack = 99,
    this.iconPath = "",
    this.isQuestItem = false,
    this.isCollectable = true,
    this.canDrop = false,
    this.dropRate = 1,
    this.rarity = Rarity.common,
    this.ownerId = "",
    this.isCraftable = false,
  }) {
    id = Uuid().v4();
    craftingRecipe = List.empty(growable: true);
  }
}
