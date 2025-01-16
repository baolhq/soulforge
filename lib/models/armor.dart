import 'dart:math';

import 'package:soulforge/enums/damage_type.dart';
import 'package:soulforge/models/item.dart';

class Armor extends Item {
  double weight;
  double durability;
  int upgradeLevel;
  bool isBroken;

  double physicalResistance;
  double magicResistance;
  double fireResistance;
  double coldResistance;
  double lightningResistance;
  double poisonResistance;

  Armor(
      {required super.name,
      required super.description,
      required super.basePrice,
      this.weight = 1,
      this.durability = 100,
      this.upgradeLevel = 0,
      this.isBroken = false,
      this.physicalResistance = 0,
      this.magicResistance = 0,
      this.fireResistance = 0,
      this.coldResistance = 0,
      this.lightningResistance = 0,
      this.poisonResistance = 0});

  /// Calculate total durability loss based on multiple damage types.
  ///
  /// **Example**:
  /// armor.calculateDurabilityLoss({
  ///   DamageType.physical: 100,
  ///   DamageType.fire: 50});
  double calculateDurabilityLoss(Map<DamageType, double> damageSource) {
    double totalDurabilityLoss = 0;
    double lossFactor = 200; // Scaling factor, higher mean more durable

    // Iterate through each damage type and calculate the loss
    damageSource.forEach((damageType, value) {
      if (value <= 0) return;
      double resistance = 0;

      switch (damageType) {
        case DamageType.physical:
          resistance = physicalResistance;
          break;
        case DamageType.magic:
          resistance = magicResistance;
          break;
        case DamageType.fire:
          resistance = fireResistance;
          break;
        case DamageType.cold:
          resistance = coldResistance;
          break;
        case DamageType.lightning:
          resistance = lightningResistance;
          break;
        case DamageType.poison:
          resistance = poisonResistance;
          break;
      }

      // Calculate individual durability loss
      double baseDurabilityLoss =
          (value / (resistance + 1)) * (1 - exp(-value / lossFactor));
      double adjustedDurabilityLoss =
          baseDurabilityLoss / (lossFactor + upgradeLevel);

      totalDurabilityLoss += adjustedDurabilityLoss;
    });

    return totalDurabilityLoss;
  }
}
