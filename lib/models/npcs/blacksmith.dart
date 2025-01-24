import 'package:flutter/material.dart';
import 'package:soulforge/models/equipments/armor.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/items/item.dart';
import 'package:soulforge/models/npcs/npc.dart';
import 'package:soulforge/models/equipments/weapon.dart';

class Blacksmith extends NPC {
  Blacksmith(String name, String background)
      : super(name: name, background: background);

  /// Fix broken or damaged armor pieces.
  void fixArmor(Character character, Armor armor) {
    if (armor.durability >= 100) {
      debugPrint("${character.name} is already at max durability.");
      return;
    }
  }

  void upgradeArmor(Character character, Armor armor) {
    int currentLevel = armor.upgradeLevel;
    int maxLevel = 10;
    if (currentLevel >= maxLevel) {
      debugPrint("${armor.name} is already at max upgrade level.");
      return;
    }

    // Calculate cost and required materials
    double upgradeCost = calculateArmorUpgradePrice(armor);
    List<Item> requiredMaterials = getUpgradeMaterials(currentLevel);

    // Actual upgrade
    character.gold -= upgradeCost.floor();
    consumeUpgradeMaterials(character.inventory, requiredMaterials);
    armor.upgradeLevel++;
    applyArmorUpgrade(armor);
    debugPrint("${armor.name} upgraded to level ${armor.upgradeLevel}");
  }

  void upgradeWeapon(Character character, Weapon weapon) {
    int currentLevel = weapon.upgradeLevel;
    int maxLevel = 10;
    if (currentLevel >= maxLevel) {
      debugPrint("${weapon.name} is already at max upgrade level.");
      return;
    }

    // Calculate cost and required materials
    double upgradeCost = calculateWeaponUpgradePrice(weapon);
    List<Item> requiredMaterials = getUpgradeMaterials(currentLevel);

    // Actual upgrade
    character.gold -= upgradeCost.floor();
    consumeUpgradeMaterials(character.inventory, requiredMaterials);
    weapon.upgradeLevel++;
    applyWeaponUpgrade(weapon);
    debugPrint("${weapon.name} upgraded to level ${weapon.upgradeLevel}");
  }

  /// Calculate price for fixing armors.
  double calculateFixPrice(Armor armor) {
    double maxDurability = 100;
    double durabilityLost = maxDurability - armor.durability;
    double costPerDurabilityPoint = 0.5;

    double price = durabilityLost * costPerDurabilityPoint;

    // Ensure minimum price for any repair
    double minimumPrice = 5.0;
    if (price < minimumPrice) price = minimumPrice;

    return price;
  }

  /// Get the list contains all required armor upgrade materials.
  List<Item> getUpgradeMaterials(int level) {
    List<Item> materials = List.empty(growable: true);

    // Quantity scale up with each upgrade level
    if (level <= 3) {
      materials.add(Item(name: "Copper Bar", quantity: level));
    } else if (level <= 6) {
      materials.add(Item(name: "Silver Bar", quantity: level - 3));
    } else if (level <= 9) {
      materials.add(Item(name: "Gold Bar", quantity: level - 6));
    } else {
      materials.add(Item(name: "Mystic Bar", quantity: 1));
    }

    return materials;
  }

  /// Applying upgrade effect on armor
  /// Cycle every 3 levels.
  void applyArmorUpgrade(Armor armor) {
    if (armor.upgradeLevel % 3 == 1) {
      armor.physicalResistance += 5;
    } else if (armor.upgradeLevel % 3 == 2) {
      armor.magicResistance += 5;
    } else {
      armor.fireResistance += 2;
      armor.coldResistance += 2;
      armor.lightningResistance += 2;
      armor.poisonResistance += 2;
    }
  }

  /// Applying upgrade effect on weapon
  /// Cycle every 3 levels.
  void applyWeaponUpgrade(Weapon weapon) {
    if (weapon.upgradeLevel % 3 == 1) {
      weapon.minDamage += 1;
    } else if (weapon.upgradeLevel % 3 == 2) {
      weapon.critChance += 5;
    } else {
      weapon.maxDamage += 1;
    }
  }

  /// Consuming the upgrade materials.
  void consumeUpgradeMaterials(
      List<Item> inventory, List<Item> requiredMaterials) {
    for (var required in requiredMaterials) {
      for (var item in inventory) {
        if (item.name == required.name) {
          if (item.quantity >= required.quantity) {
            item.quantity -= required.quantity;
          } else {
            throw Exception("Not enough ${item.name} to complete the upgrade");
          }
        }
      }
    }

    // Remove item with zero quantity
    inventory.removeWhere((item) => item.quantity <= 0);
  }

  /// Calculate upgrade price for armor.
  double calculateArmorUpgradePrice(Armor armor) {
    double basePrice = armor.baseUpgradePrice;
    int currentLevel = armor.upgradeLevel;

    // Dynamic scaling: the cost increases exponentially or linearly with each level
    double scalingFactor = 1.25;
    return basePrice * (scalingFactor * currentLevel);
  }

  /// Calculate upgrade price for weapon.
  double calculateWeaponUpgradePrice(Weapon weapon) {
    double basePrice = weapon.baseUpgradePrice;
    int currentLevel = weapon.upgradeLevel;

    // Dynamic scaling: the cost increases exponentially or linearly with each level
    double scalingFactor = 1.5;
    return basePrice * (scalingFactor * currentLevel);
  }
}
