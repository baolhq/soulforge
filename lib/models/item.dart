import 'package:soulforge/enums/rarity.dart';
import 'package:soulforge/enums/rune_type.dart';
import 'package:uuid/uuid.dart';

class Item {
  late String id;
  final String name;
  final String description;
  int levelRequirement;
  int quantity;
  int maxQuantity;
  double basePrice;
  String iconPath;
  bool isUsable;
  bool isQuestItem;
  bool isCollectable;
  bool canDrop;
  double dropRate;
  bool isRune;
  RuneType runeType;
  Rarity rarity;
  String ownerId;
  bool isCraftable;
  late List<Item> craftingRecipe;

  Item({
    required this.name,
    this.description = "",
    this.levelRequirement = 0,
    this.quantity = 0,
    this.maxQuantity = 99,
    this.basePrice = 0,
    this.iconPath = "",
    this.isUsable = false,
    this.isQuestItem = false,
    this.isCollectable = true,
    this.canDrop = false,
    this.dropRate = 1,
    this.isRune = false,
    this.runeType = RuneType.none,
    this.rarity = Rarity.common,
    this.ownerId = "",
    this.isCraftable = false,
  }) {
    id = Uuid().v4();
    craftingRecipe = List.empty(growable: true);
  }
}
