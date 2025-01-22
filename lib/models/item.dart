class Item {
  int? id;
  final String name;
  final String? description;
  int? levelRequirement;
  int quantity;
  int? maxQuantity;
  double weight;
  double basePrice;
  String? iconPath;
  bool isUsable;
  bool isQuestItem;
  bool isCollectible;
  bool canDrop;
  double dropRate;
  int? runeId;
  int rarityId;
  int ownerId;
  late List<Item> craftingRecipe;

  Item({
    required this.name,
    this.description,
    this.levelRequirement,
    this.quantity = 0,
    this.maxQuantity,
    this.weight = 0,
    this.basePrice = 0,
    this.iconPath,
    this.isUsable = false,
    this.isQuestItem = false,
    this.isCollectible = true,
    this.canDrop = false,
    this.dropRate = 1,
    this.runeId,
    this.rarityId = 1,
    this.ownerId = 1,
  }) {
    craftingRecipe = List.empty(growable: true);
  }
}
