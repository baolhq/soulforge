import 'package:flutter/material.dart';
import 'package:soulforge/enums/npc_role.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/npcs/npc.dart';

class Vendor extends NPC {
  late List<Item> inventory;
  int gold;
  int bribeAmount = 0;
  int maxBribeThreshold;
  late Map<Item, int> buyBackPrices; // Track sold item prices

  Vendor(String name, String background,
      {this.gold = 100, this.maxBribeThreshold = 100})
      : super(name: name, background: background, role: NpcRole.vendor) {
    inventory = List.empty(growable: true);
    buyBackPrices = {};
  }

  /// Bribe the vendor, affecting the item buying and selling price
  void bribe(int amount) {
    bribeAmount += amount;
    debugPrint("Bribed vendor with $amount gold. Total bribe: $bribeAmount.");
  }

  /// Vendor buying tem from character.
  void buyItem(Character seller, Item item) {
    int adjustedPrice = calculateBuyPrice(seller, item);

    if (gold >= adjustedPrice) {
      seller.gold += adjustedPrice;
      seller.inventory.remove(item);
      inventory.add(item);

      // Track the buy-back price, add 10% subcharge
      buyBackPrices[item] = (adjustedPrice * 1.1).round();

      debugPrint(
          "${seller.name} sold ${item.name} to the vendor for $adjustedPrice gold.");
    } else {
      debugPrint(
          "The vendor doesn't have enough gold to buy ${item.name} from ${seller.name}!");
    }
  }

  /// Vendor selling item to character.
  void sellItem(Character buyer, Item item) {
    int adjustedPrice = calculateSellPrice(buyer, item);

    if (buyer.gold >= adjustedPrice) {
      buyer.gold -= adjustedPrice;
      buyer.inventory.add(item);
      debugPrint("${buyer.name} bought ${item.name} for $adjustedPrice gold.");
    } else {
      debugPrint("${buyer.name} doesn't have enough gold!");
    }
  }

  /// Buy back sold item for this vendor.
  void buyBackItem(Character buyer, Item item) {
    if (buyBackPrices.containsKey(item)) {
      int buyBackPrice = buyBackPrices[item]!;

      if (buyer.gold >= buyBackPrice) {
        buyer.gold -= buyBackPrice;
        buyer.inventory.add(item);
        inventory.remove(item);
        buyBackPrices.remove(item); // Remove the buy-back price from the map

        debugPrint(
            "${buyer.name} bought back ${item.name} for $buyBackPrice gold.");
      } else {
        debugPrint(
            "${buyer.name} doesn't have enough gold to buy back ${item.name}.");
      }
    } else {
      debugPrint("${item.name} is no longer available for buy-back.");
    }
  }

  /// Calculate the adjusted price for selling to the character
  int calculateSellPrice(Character character, Item item) {
    double bribeModifier = 1.0 - (bribeAmount / maxBribeThreshold);
    if (bribeModifier < 0.5) {
      bribeModifier = 0.5; // Ensure bribe doesn't reduce price below 50%
    }

    // Calculate charisma modifier: each point above/below 10 adds/subtracts 5%
    double charismaModifier = 1.0 - ((character.charisma - 10) * 0.05);
    double finalModifier = bribeModifier * charismaModifier;

    return (item.basePrice * finalModifier).round();
  }

  // Calculate the adjusted price for buying from the player (lower price)
  int calculateBuyPrice(Character seller, Item item) {
    double bribeModifier = 1.0 - (bribeAmount / maxBribeThreshold);
    if (bribeModifier < 0.5) {
      bribeModifier = 0.5; // Ensure bribe doesn't reduce price below 50%
    }

    // Vendor always pays less when buying from the player
    double buyModifier = 0.5;
    double charismaModifier = 1.0 + ((seller.charisma - 10) * 0.05);
    double finalModifier = buyModifier * bribeModifier * charismaModifier;

    return (item.basePrice * finalModifier).round();
  }
}
