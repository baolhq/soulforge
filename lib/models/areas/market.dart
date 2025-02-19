// market.dart
//
// Focuses on buying and selling items with multiple vendors.

import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/items/item.dart';
import 'package:soulforge/models/npcs/npc.dart';
import 'package:soulforge/models/npcs/vendor.dart';

class Market {
  final int? id;
  final String name;
  final String? description;
  late List<NPC> npcs;

  Market({
    required this.name,
    this.id,
    this.description,
  }) {
    npcs = List.empty(growable: true);
  }

  void addNPC(NPC npc) {
    npcs.add(npc);
  }

  void buyItem(Character buyer, Vendor vendor, Item item) {
    // Implement logic for buying item
  }

  void sellItem(Character seller, Vendor vendor, Item item) {
    // Implement logic for selling item
  }
}
